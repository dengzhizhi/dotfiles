#!/usr/bin/env /usr/local/bin/bb

(require '[clojure.tools.cli :refer [parse-opts]]
         '[babashka.process :refer [process $]]
         '[clojure.java.io :as io])

(def cli-options
    [["-f" "--file FILE" "file path. It can also contain line and column number in the format of `<filename>:<line>:<col>`, e.g. myfile:20:6"
        :default ""
     ]
     ["-l" "--line LINE" "line number"
        :default 0
        :parse-fn #(Integer/parseInt %)
     ]
     ["-c" "--column COL" "column number"
        :default 0
        :parse-fn #(Integer/parseInt %)
      ]
     [nil "--stdin" "Should read text from stdin for filename extraction"]
     [nil
      "--cursor CURSOR_COLUMN"
      "1-based cursor column number for file name extraction in the stdin"
        :default 0
        :parse-fn #(Integer/parseInt %)
      ]
     ["-e" "--editor EDITOR"
      "The editor to open the file, the value can be 'idea', 'webstorm', 'pycharm', 'vscode', 'sublime', 'vim-kitty'.
            for vim-kitty to work, install kitty (https://github.com/kovidgoyal/kitty), add `allow_remote_control yes` and
            `listen_on unix:/tmp/mykitty` in its config file `~/.config/kitty/kitty.conf`. See https://sw.kovidgoyal.net/kitty/remote-control/ for detail."
        :default "vim-kitty"
        :validate [#(or
                      (= % "idea")
                      (= % "webstorm")
                      (= % "pycharm")
                      (= % "vscode")
                      (= % "vim-kitty")
                      (= % "sublime"))
                   "Unknown editor"]
      ]
     ["-h" "--help"]
    ])



;; Use your own uuid key for nvim remote channel
(defn nvim-remote-pipe []
  (str (System/getenv "HOME") "/.cache/nvim/server-1d4dbb68-42a4-7929-a9c2-7f89385676a3.pipe"))

;; default kitty remote channel
(def kitty-channel "unix:/tmp/mykitty")

(defn open-in-vim-kitty [opts]
  (let [
        kitty-activation-ex-cmd (str ":AsyncRun -silent /Applications/kitty.app/Contents/MacOS/kitty @ --to " kitty-channel " focus-window")
        set-cursor-ex-cmd (str (max (:line opts) 1) "G0" (:column opts) "|zz")]
    (process ["/Users/zdeng/bin/nvim/0.8.0/bin/nvim" "--server" (nvim-remote-pipe) "--remote" (:file opts)])
    (process ["/Users/zdeng/bin/nvim/0.8.0/bin/nvim" "--server" (nvim-remote-pipe) "--remote-send"
              (str "<esc>" set-cursor-ex-cmd ":AsyncRun -silent " kitty-activation-ex-cmd "<cr>")] )))

(defn open-vim-kitty [opts]
  (process ["/Applications/kitty.app/Contents/MacOS/kitty" "@" "--to" kitty-channel "send-text" (str "/Users/zdeng/bin/nvim/0.8.0/bin/nvim --listen " (nvim-remote-pipe) "\n")]))

(defn open-in-idea [opts]
  (process [(:editor opts)
            "--line" (:line opts)
            "--column" (:column opts)
            (:file opts)]))

(defn open-idea [opts] ($ ~(:editor opts)))

(defn open-in-vscode [opts]
  (process ["/usr/local/bin/code" "--goto" (str (:file opts) ":" (:line opts) ":" (:column opts))]))

(defn open-vscode [opts] ($ code))

(defn open-in-sublime [opts]
  (process ["subl" (str (:file opts) ":" (:line opts) ":" (:column opts))]))

(defn open-sublime [opts] ($ subl))

(defn destruct-location-ref [content]
  "Desctruct a location ref in <filename>:<line>:<col> format"
  (if-let [parts (re-matches #"([^:]+)(?::(\d+))?(?::(\d+))?" content)]
    {:file (nth parts 1)
     :line (or (some-> (nth parts 2) Integer/parseInt) 0)
     :column (or (some-> (nth parts 3) Integer/parseInt) 0)
     }))

(defn strict-destruct-location-ref [content]
  "Desctruct a location ref in <filename>:<line>:<col> format and the line number mandatory, return nil otherwise"
  (if-let [parts (re-matches #"([^:]+)(?::(\d+))(?::(\d+))?" content)]
    {:file (nth parts 1)
     :line (Integer/parseInt (nth parts 2))
     :column (or (some-> (nth parts 3) Integer/parseInt) 0)
     }))

(defn extract-location-ref [content cursor-location]
  "Extract a location ref in the current location"
  (let [adjust-cursor-location (dec cursor-location)]
    (loop [parts (-> content (str/split #"\s") seq)
           char_sum -1
           word ""]
      (cond
        (and (< char_sum adjust-cursor-location) (not (empty? parts)))
          (recur (rest parts) (+ char_sum (count (first parts)) 1) (first parts))
        (= char_sum adjust-cursor-location) "" ;; The cursor is on the delimiter
        :else word))))

(defn extract-opts [opts]
  "Extract filename and cursor location from stdin"
  (let [line (-> *in* io/reader line-seq first)]
    (if (= (:cursor opts) 0)
      (destruct-location-ref line)
      (let [location-ref (extract-location-ref line (:cursor opts))]
        (destruct-location-ref location-ref)))))

(defn open-in-editor [opts]
  (let [editor (:editor opts)
        stdin? (:stdin opts)
        extracted-opts (as-> opts $
                         (if stdin? (extract-opts $) $)
                         (or (some-> $ :file strict-destruct-location-ref) $)
                         (merge opts $))
        file? (not= (:file extracted-opts) "") ]
    (cond
      (or (= editor "idea")
          (= editor "webstorm")
          (= editor "pycharm")) ((if file? open-in-idea open-idea) extracted-opts)
      (= editor "vscode") ((if file? open-in-vscode open-vscode) extracted-opts)
      (= editor "vim-kitty") ((if file? open-in-vim-kitty open-vim-kitty) extracted-opts)
      (= editor "sublime") ((if file? open-in-sublime open-sublime) extracted-opts))))

(let [
      parsed-opts (parse-opts *command-line-args* cli-options)
      err (:errors parsed-opts)
      opts (:options parsed-opts)]
  (when err (-> err first println))
  (if (or (:help opts) err)
    (-> parsed-opts :summary println)
    (open-in-editor opts))
  (println "Done")
  nil)
