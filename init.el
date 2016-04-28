
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(server-start)
;; remove menus, tool-bars, scroll bars, splash-screen, and startup-message
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(defalias 'yes-or-no-p 'y-or-n-p)

(setenv "NODE_NO_READLINE" "1")
;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)
(setq load-prefer-newer t)

(setq uniquify-buffer-name-style 'forward)

(setq ispell-program-name "/usr/local/bin/aspell")

(setq frame-title-format '(:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b")))

(setq magit-last-seen-setup-instructions "1.4.0")

(setq-default indent-tabs-mode nil)

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; group backup files together to prevent clutter
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; (add-to-list 'package-archives '("elpa" . "http://elpa.gnu   .org/packages/"))

;; setup my packages
(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

(require 'pallet)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(recentf-mode 1)
(setq recentf-max-menu-items 500)

(key-chord-mode 1)

(use-package winner
  :config
  (winner-mode 1))

(use-package uniquify)

(use-package auto-complete
  :diminish auto-complete-mode
  :config
  (progn
    (ac-config-default)
    (setq ac-use-menu-map t
          ac-use-fuzzy t
          ac-delay 0.025
          ac-quick-help-delay 0.25))
  :bind
  (("C-<up>" . ac-quick-help-scroll-up)
   ("C-<down>" . ac-quick-help-scroll-down)))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package helm
  :config
  (progn 
    (require 'helm-config)
    (use-package helm-projectile)
    (use-package helm-ls-git)
    (use-package helm-bind-key)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0)         ; update fast sources immediately (doesn't).
    (setq helm-input-idle-delay 0.01)  ; this actually updates things reeeelatively quickly.
    (setq helm-quick-update t)
    (setq helm-adaptive-mode nil)
    (setq helm-bookmark-show-location t)
    (setq helm-M-x-requires-pattern nil)
    (setq helm-ff-skip-boring-files t)
    (setq helm-buffer-max-length 30)
    (setq helm-ff-file-name-history-use-recentf t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match    t)
    (setq helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match    t)
    
    (helm-mode 1))
  :bind 
  (("C-x C-f" . helm-find-files)
   ("C-x l" . helm-ls-git-ls)
   ("C-x a" . helm-apropos)
   ("M-x" . helm-M-x)
   ("M-k" . helm-project-search)
   ("M-K" . my-helm-do-ag)
   ("C-x b" . helm-projectless-search)
   ("H-n" . helm-scroll-other-window)
   ("H-p" . helm-scroll-other-window-down)
   ("C-x t" . helm-imenu)
   ("M-C-p" . helm-eshell-history)
   ("C-c f" . helm-dash)
   ("C-x f" . helm-recentf)
   ("C-x y" . helm-show-kill-ring)
   ("C-x C-b" . helm-bookmarks)
   ("M-." . helm-locate)
   ("M-j" . helm-resume)))

(use-package drag-stuff
  :diminish drag-stuff-mode
  :config
  (drag-stuff-global-mode 1)
  :bind
  (("M-N" . drag-stuff-down)
   ("M-P" . drag-stuff-up)
   ("M-B" . drag-stuff-left)
   ("M-F" . drag-stuff-right)))

(use-package multiple-cursors
  :bind
  (("s-n" . mc/mark-next-like-this)
   ("s-N" . mc/unmark-next-like-this)
   ("s-p" . mc/mark-previous-like-this)
   ("s-P" . mc/unmark-previous-like-this)
   ("C-S-c C-S-c" . mc/edit-lines)))

(use-package color-theme)

;; behavior and appearance stuff

;; (load-theme 'base16-google-light t)
;; (load-theme 'apropospriate-dark t)
(load-theme 'leuven t)
(setq ring-bell-function 'ignore)
(toggle-word-wrap 1)

(setq redisplay-dont-pause t)

;; add newline to file on save
(setq require-final-newline t)
;; font color and size
(set-face-attribute 'default nil :family "inconsolata" :height 145)
;; (set-face-attribute 'default nil :family "share tech mono" :height 145)
(setq-default line-spacing 1)
;; (add-hook 'afer-change-major-mode-hook 'set-custom-line-spacing)

;; (defun set-custom-line-spacing ()
;;   (add-text-properties (point-min) (point-max)
;;                        '(line-spacing 0.25 line-height 1.25)))  

(blink-cursor-mode -1)
(global-subword-mode 1)
(delete-selection-mode 1)
(auto-indent-mode 1)
(setq-default truncate-lines t)

(prefer-coding-system 'utf-8)

(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-relative-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(use-package git-gutter
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 1)
  ;; (git-gutter:linum-setup)
  :bind
  (("C-x <down>" . my-next-edit)
   ("C-x <up>" . my-previous-edit)
   ("C-x C-r" . git-gutter:revert-hunk)
   ("C-x C-d" . git-gutter:popup-hunk)))

;; (custom-set-variables '(git-gutter:hide-gutter nil))

;; (use-package guide-key
;;   :diminish guide-key-mode
;;   :config
;;   (progn
;;     (setq guide-key/recursive-key-sequence-flag t)
;;     (setq guide-key/popup-window-position 'right)
;;     (setq guide-key/idle-delay 0)
;;     (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "M-r" "M-d"))
;;     (guide-key-mode 1)))

(use-package helm-swoop
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)))

(use-package expand-region)

(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode)
   ("\\.json\\'" . js2-mode))
  :interpreter "node"
  ;; :no-require t
  :config
  (setq-default js2-global-externs '("describe" "it" "module" "require" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
  (setq-default js2-basic-offset 2)
  (js2-imenu-extras-setup))

;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'progn
  '(tern
    (require 'tern-auto-complete)
    (tern-ac-setup)))

(use-package ruby-mode
  :mode
  (("\\.rake\\'" . ruby-mode)
   ("\\Rakefile\\'" . ruby-mode)
   ("\\Gemfile\\'" . ruby-mode)
   ("\\.gemspec\\'" . ruby-mode)
   ("\\kwmrc\\'" . ruby-mode))
  :init
  (progn 
    (require 'ruby-block)
    (ruby-block-mode t)
    ;; do overlay
    (setq ruby-block-highlight-toggle 'overlay)
    ;; display to minibuffer
    (setq ruby-block-highlight-toggle 'minibuffer)
    ;; display to minibuffer and do overlay
    (setq ruby-block-highlight-toggle t)))

(use-package coffee-mode
  :config
  (setq coffee-tab-width 2))

;; # Automatically Turn on the mode for your buffer of choice.
;;(add-hook 'js2-mode-hook (lambda () (kite-mode t)))

;;(add-hook 'css-mode-hook (lambda () (kite-mode t)))


;; (use-package smooth-scroll
;;   :config
;;   (smooth-scroll-mode 1)
;;   (setq smooth-scroll/vscroll-step-size 5)
;;   )

;; (require 'kite "/Users/dylanconlin/.emacs.d/configs/emacs-websocket/websocket.el")

;; (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2)
;; ;; (custom-set-variables '(coffee-tab-width 2))

(use-package css-mode)
(use-package scss-mode
  :config
  ;; disable scss-mode from compiling on save
  (setq scss-compile-at-save nil))

(use-package sass-mode
  )
(use-package rainbow-mode
  :init
  (progn
    (add-hook 'css-mode-hook 'rainbow-mode)
    (add-hook 'scss-mode-hook 'rainbow-mode)
    (add-hook 'sass-mode-hook 'rainbow-mode)
    (add-hook 'web-mode-hook 'rainbow-mode)
    (add-hook 'haml-mode-hook 'rainbow-mode)
    (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)))

(use-package haml-mode
  :config
  (progn
    (add-hook 'haml-mode-hook (lambda ()
                                (setq comment-start "-# "
                                      comment-end "")))))

(use-package pallet
  :config
  (pallet-mode t))

(use-package point-undo
  :bind
  (("M-/" . point-undo)
   ("M-." . point-redo)))

(use-package dired-details+)

(use-package itail)

(use-package dired-sort)

(use-package saveplace
  :config
  (progn
    (setq save-place-file "~/.emacs.d/saveplace")
    (setq-default save-place t)))

(use-package eshell
  :ensure t
  :bind
  ("C-x p s" . start-eshell-in-split-window)
  :config
  (progn
    (add-hook 'eshell-mode-hook
              #'(lambda ()
                  (define-key eshell-mode-map
                    [remap eshell-pcomplete]
                    'helm-esh-pcomplete))))
  (defadvice shell (before advice-utf-shell activate)
    (set-default-coding-systems 'utf-8)))

(use-package edit-server
  :if window-system
  :init
  (progn
    (add-hook 'after-init-hook 'server-start t)
    (add-hook 'after-init-hook 'edit-server-start t)))

(use-package markdown-mode
  :config
  (progn
    (add-hook 'markdown-mode-hook
              (lambda ()
                ;; (require 'flyspell-lazy)
                (visual-line-mode t)
                ;; (flyspell-lazy-mode 1)
                ;; (flyspell-mode 1)
		))))

(use-package org
  :bind
  (("C-S-n" . org-move-subtree-down)
   ("C-c c" . org-capture)
   ("C-c l" . org-capture-goto-last-stored)
   ("C-c a" . org-agenda))
  :init
  (progn
    (require 'org-install)
    (require 'org-crypt)
    (require 'gnus-async)
    (add-hook 'org-mode-hook
              (lambda ()
                ;; (require 'flyspell-lazy)
                (visual-line-mode t)
                ;; (flyspell-lazy-mode 1)
                ;; (flyspell-mode 1)
                ))
    
    ;; prettier appearance settings
    (setq org-log-done t)
    (setq org-startup-indented t)
    (setq org-hide-leading-starts t)

    ;; behavior settings
    (setq org-use-fast-todo-selection t)
    
    ;; setup org path
    (setq org-default-notes-file (expand-file-name "~/Dropbox/org/notes.org"))
    
    ;; setup files agenda is aware of
    (setq org-agenda-files '("~/Dropbox/org/code.org"
                             "~/Dropbox/org/notes.org"
                             "~/Dropbox/org/shortstack.org"
                             "~/Dropbox/org/journal.org"
                             "~/Dropbox/org/todo.org"))
    (setq org-capture-templates
          '(
            ("c" "Code" entry (file+headline "~/Dropbox/org/code.org" "Code") "* %^{title} %^g \n %? \n%U")
            ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes") "* %^{title} %^g \n %? \n%U")
            ("r" "Secret" entry (file+headline "~/Dropbox/org/secrets.org" "Secrets") "* %^{title} %^g \n %? \n%U")
            ("j" "Journal" entry (file+headline "~/Dropbox/org/journal.org" "Journal") "* %^{title} %^g \n %? \n%U")
            ("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Tasks") "* TODO %^{title} %^g \n %? \n%U")
            ("l" "Ledger entries")
            ("lc" "Cash" plain (file "~/Dropbox/org/main.ledger") "%(org-read-date) * %^{Payee} Expenses:%^{Account} %^{Amount}")))
    (setq org-refile-targets
          '(("~/Dropbox/org/notes.org" . (:level . 1))
            ("~/Dropbox/org/todo.org" . (:level . 1))
            ("~/Dropbox/org/shortstack.org" . (:level . 1))
            ("~/Dropbox/org/secrets.org" . (:level . 1))
            ("~/Dropbox/org/code.org" . (:level . 1))
            ("~/Dropbox/org/blogs.org" . (:level . 1))))))


(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; (use-package evil-smartparens

;;   :init
;;   (evil-smartparens-mode 1))

;; (use-package evil-mode
;;   :init 
;;   (global-evil-leader-mode)
;;   (evil-mode 1)
;;   (evil-escape-mode 1)
;;   (global-evil-surround-mode 1)
;;   (evil-leader/set-leader ",")
;;   (setq evil-leader/in-all-states 1))

;; (global-set-key (kbd "C-g") 'evil-escape)

(smartparens-global-mode)
;;   ;; evil cursor
;; ;; (setq evil-emacs-state-cursor '("red" box))
;; ;; (setq evil-normal-state-cursor '("green3" box))
;; ;; (setq evil-visual-state-cursor '("orange" box))
;; ;; (setq evil-insert-state-cursor '("red" bar))
;; ;; (setq evil-replace-state-cursor '("blue" bar))
;; ;; (setq evil-operator-state-cursor '("pink" hollow))
;; (global-set-key (kbd "C-g") 'evil-escape)

;; (evilnc-default-hotkeys)

;; ;; Vim key bindings
;; (evil-leader/set-key
;;   "ci" 'evilnc-comment-or-uncomment-lines
;;   "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
;;   "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
;;   "cc" 'evilnc-copy-and-comment-lines
;;   "cp" 'evilnc-comment-or-uncomment-paragraphs
;;   "cr" 'comment-or-uncomment-region
;;   "cv" 'evilnc-toggle-invert-comment-line-by-line
;;   "\\" 'evilnc-comment-operator)

;; (define-key evil-motion-state-map (kbd "C-w C-s") #'evil-split-window-h-and-move-there)
;; (define-key evil-motion-state-map (kbd "C-w C-v") #'evil-split-window-v-and-move-there)


;; (use-package emojify
;;   :config
;;   (global-emojify-mode 1))

;; (toggle-indicate-empty-lines)
(setq show-paren-mode nil)
(show-smartparens-global-mode +1)
(setq show-trailing-whitespace nil)
;; (set-background-color "white")
(set-face-attribute 'region nil :background "lightblue")
(set-border-color "red")

(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d/emms/")
(add-to-list 'load-path "~/usr/local/bin/mp3info/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")
(setq emms-player-mplayer-command-name "/usr/local/bin/mplayer")
(setq emms-player-list '(emms-player-mplayer
                         emms-player-mpg321
                         emms-player-mpd))

(setq emms-info-auto-update t)
(setq emms-info-asynchronously t)
(setq debug-on-error t)
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)
;; (require 'emms-setup)
;; (require 'emms-player-mplayer)
;; (emms-standard)
;; (emms-default-players)
;; (emms-playing-time-enable-display)
;; (define-emms-simple-player mplayer '(file url)
;;   (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;                 ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;                 ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
;;   "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
;; (require 'emms-playing-time)
;; (emms-playing-time 1)
;; (emms-cache-enable)


;; (use-package emms
;;   :ensure t
;;   :config
;;   (progn
;;     (require 'emms-setup)
;;     (require 'emms-player-mpd)
;;     (require 'emms-player-vlc)
;;     (require 'emms-browser)
;;     (require 'emms-history)
;;     (require 'emms-info-libtag)
;;     (require 'emms-mark)
;;     (setq emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music")
;;     (add-to-list 'emms-player-list 'emms-player-mpd)
;;     (emms-standard)
;;     (emms-default-players)
;;     (setq emms-info-functions '(emms-info-libtag))
;;     (define-emms-simple-player mplayer '(file url)
;;       (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;                     ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;                     ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
;;       "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
;;     (setq emms-track-description-function 'fg-emms-track-description)
;;     (emms-history-load))
;;   :bind (("C-x p e" . emms)
;;          ("C-x p k" . emms-soulseek)))


(use-package ledger-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))))

;; (setq x-select-enable-clipboard t
;;       x-select-enable-primary t
;;       save-interprogram-paste-before-kill t
;;       apropos-do-all t
;;       mouse-yank-at-point t
;;       require-final-newline t
;;       ediff-window-setup-function 'ediff-setup-windows-plain
;;       save-place-file (concat user-emacs-directory "places"))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

(use-package utilities-setup)
(use-package bindings-setup)
(use-package hydras)
(use-package vc-git)
(use-package repository-root)

(set-exec-path-from-shell-PATH)

(find-file "~/.emacs.d/init.el")

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(use-package rvm
  :config
  (rvm-use-default))

;; (autoload 'dash-at-point "dash-at-point"
;;   "Search the word at point with Dash." t nil)

(defun javascript-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript")))

(add-hook 'js2-mode-hook 'javascript-doc)

(defun ruby-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Ruby")))

(add-hook 'ruby-mode-hook 'ruby-doc)

(defun css-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS")))

(defun clojure-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Clojure")))

(add-hook 'clojure-mode-hook 'clojure-doc)
(add-hook 'clojurescript-mode-hook 'clojure-doc)
(add-hook 'scss-mode-hook 'css-doc)
(add-hook 'css-mode-hook 'css-doc)

(avy-setup-default)

;; I know-your-http-we… 20151220… available  melpa 1539  Look up the meaning of HTTP headers, methods, relations, status codes 
;; I ledger-mode      h 20160111… available  melpa 1521  Helper code for use with the "ledger" command-line tool 
;; I literate-starter-… 20150730… available  melpa  629  A literate starter kit to configure Emacs using Org-mode files. 
;; I restclient       h 20151128… available  melpa  493  An interactive HTTP client for Emacs 
;; I pdf-tools        h 20151224… available  melpa  325  Support library for PDF documents. 
;; I git-timemachine  h 20160105… available  melpa  285  Walk through git reviosions of a file 

(global-hl-line-mode 0)

(require 'popwin)
(popwin-mode 1)
(push '(direx:direx-mode :position left :width 50 :dedicated t :stick t) popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; (defun fci-enabled-p () (symbol-value 'fci-mode))

;; (defvar fci-mode-suppressed nil)
;; (make-variable-buffer-local 'fci-mode-suppressed)

;; (defadvice popup-create (before suppress-fci-mode activate)
;;   "Suspend fci-mode while popups are visible"
;;   (let ((fci-enabled (fci-enabled-p)))
;;     (when fci-enabled
;;       (setq fci-mode-suppressed fci-enabled)
;;       (turn-off-fci-mode))))

;; (defadvice popup-delete (after restore-fci-mode activate)
;;   "Restore fci-mode when all popups have closed"
;;   (when (and fci-mode-suppressed
;;              (null popup-instances))
;;     (setq fci-mode-suppressed nil)
;;     (turn-on-fci-mode)))

;; ;; fontify code in code blocks
;; (setq org-src-fontify-natively t)

;; (use-package fill-column-indicator
;;   :init
;;   (progn (add-hook 'prog-mode-hook 'fci-mode))
;;   :config
;;   (setq fci-rule-column 80))


;; (require 'edbi)
(require 'helm-kickass)
(use-package web-mode)
