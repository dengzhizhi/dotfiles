;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zhizhi Deng"
      user-mail-address "zdeng@example.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq scroll-margin 10)
(setq vterm-max-scrollback 99999)
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'meta)
(set-fill-column 120)
(auto-fill-mode)
(map!
 :nv ", y y" #'clipboard-kill-ring-save
 :n  ", y p" #'clipboard-yank

 :n "g s s" #'evil-avy-goto-char

 :n  "SPC d f u SPC" #'+workspace/switch-to
 :n  "SPC d f i SPC" #'+workspace/other
 :n  "SPC s i SPC" #'treemacs-find-file

 :n  "SPC e f j SPC" #'counsel-projectile-rg
 :n  "SPC e f k SPC" #'counsel-rg
 :n  "SPC e f l SPC" #'counsel-ibuffer
 :n  "SPC e f o SPC" #'counsel-google
 :n  "SPC e f i SPC" #'counsel-fzf


 :n  "SPC s d j SPC" #'org-hide-block-toggle
 :n  "SPC s d k SPC" #'org-hide-block-all
 :n  "SPC s d l SPC" #'org-show-block-all
)

;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-groups '((:name "Today"
;;                                    :time-grid t
;;                                    :scheduled today)
;;                                   (:name "Due today"
;;                                    :deadline today)
;;                                   (:name "Important"
;;                                    :priority "A")
;;                                   (:name "Overdue"
;;                                    :deadline past)
;;                                   (:name "Due soon"
;;                                    :deadline future)
;;                                   (:name "Big Outcomes"
;;                                    :tag "bo")))
;;   :config
;;   (org-super-agenda-mode))

(use-package! org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(use-package! evil-matchit
  :config
  (global-evil-matchit-mode 1))

(use-package! ascii-art-to-unicode)

(use-package! org-superstar
  :hook
  (org-mode . org-superstar-mode))

;; (use-package! indium
;;   :config
;;   (setq indium-debugger-blackbox-regexps ".*"))
(use-package! command-log-mode)
(use-package! org-download)

;; (use-package! calibredb
;;   :defer t
;;   :init
;;   (autoload 'calibredb "calibredb")
;;   :config
;;   (setq calibredb-root-dir "~/dev/zhizhi/Calibre")
;;   (setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
;;   (setq calibredb-library-alist '(("~/dev")
;;                                   ("~/Books"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(setq org-agenda-include-diary t)

(setq org-tags-column -120
      org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
      org-todo-keyword-faces
      '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
        ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
        ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
        ("DONE" :foreground "#50a14f" :weight normal :underline t)
        ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))
      )
(setq org-roam-directory "~/dev/zhizhi/notes/roam")
