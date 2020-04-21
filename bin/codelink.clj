#!/usr/local/bin/bb

(require '[clojure.tools.cli :refer [parse-opts]]
         '[babashka.process :refer [process check $]]
         '[babashka.fs :as fs]
         '[clojure.java.io :as io]
         '[clojure.string :as string]
         )

(def cli-options
  [["-f" "--file FILE" "Full file path"
    :validate [#(some? %) "Must provide a file"]]
   ["-l" "--line LINE"
    "Optionally specify a line location or the first line of selection"
    :default 0
    :parse-fn #(Integer/parseInt %)]
   ["-e" "--end-line END"
    "Optionally specify the ending line of selection"
    :default 0
    :parse-fn #(Integer/parseInt %)]
   ["-o" "--open" "Should open link automatically" ]
   ["-c" "--copy" "Should put link into system clipboard"]
   ["-p" "--print" "Should print link into stdout"]
   ["-h" "--help" "Show help message"]])

;; Modify the remote origin url pattern and rules to build a link here
;; Find out remote origin url using cli command `git config --get remote.origin.url` in your repo
(def sites
  {:bitbucket-org
   {:origin-url-pattern #"@bitbucket\.org:([^/]+)/([^/]+)\.git$"
    :generator
    (fn [path line1 line2 revision url-matches]
      (apply str (flatten
                   ["https://bitbucket.org/"
                    (nth url-matches 1) "/" (nth url-matches 2)
                    "/src/" revision "/" path
                    (when (> line1 0)
                      ["#lines-" line1 (when (> line2 0) [":" line2])])])))}
   :github
   {:origin-url-pattern #"git@github\.com:([^/]+)/([^/]+)\.git"
    :generator
    (fn [path line1 line2 revision url-matches]
      (apply str (flatten
                   ["https://github.com/"
                    (nth url-matches 1) "/" (nth url-matches 2)
                    "/blob/" revision "/" path
                    (when (> line1 0)
                      ["#L" line1 (when (> line2 0) ["-L" line2])])])))}
   })

(defn run-git-command [cmd dir purpose]
  (try
    (-> @(process cmd {:dir dir :out :string})
        :out
        (string/replace #"\n+$" ""))
    (catch Exception ex
      (let [cause (-> ex Throwable->map :cause)]
        (throw (Exception. (str "Failed to " purpose " for " dir ": " cause)))))))

(defn get-git-remote-url [dir]
  (run-git-command '["git" "config" "--get" "remote.origin.url"], dir, "get origin url"))

(defn get-project-root [dir]
  (run-git-command '["git" "rev-parse" "--show-toplevel"], dir, "get project root"))

(defn get-file-revision [file-path]
  (let [dir (-> file-path fs/parent .toString)]
    (run-git-command ["git" "log" "-1" "--pretty=format:%H" "--" file-path], dir, (str "get revision for " file-path))))

(defn remove-project-root [file-path project-root]
  (subs file-path (inc (count project-root))))

(defn generate-link [opts]
  (let [file-path (:file opts)
        dir (-> file-path fs/parent .toString)
        remote-url (get-git-remote-url dir)
        revision (get-file-revision file-path)
        inner-path (remove-project-root file-path (get-project-root dir))
        matched-site (->> sites
                       vals
                       (map #(vector (:generator %) (re-find (:origin-url-pattern %) remote-url)))
                       (filter #(some? (second %)))
                       first)]
    (when (some? matched-site)
      ((first matched-site) inner-path (:line opts) (:end-line opts) revision (second matched-site)))))

(defn send-to-clipboard [text]
  (let [pbcopy (process ["pbcopy"])
        stdin (io/writer (:in pbcopy))]
    (binding [*out* stdin] (print text))
    (.close stdin)
    (:exit @pbcopy)))

(def args *command-line-args*)

(let [parsed-opts (parse-opts args cli-options)
      err (:errors parsed-opts)
      opts (:options parsed-opts)]
  (if err (prn err))
  (if (or (:help opts) err)
    (-> parsed-opts :summary println)
    (let [link (generate-link opts)]
      (when (:open opts) (process ["open" link]))
      (when (:print opts) (println link))
      (when (:copy opts) (send-to-clipboard link))))
  nil)
