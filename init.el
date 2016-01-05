(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; ;; remove menus, tool-bars, scroll bars, splash-screen, and startup-message
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

;; (add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

;; setup my packages
(require 'cask "/usr/local/Cellar/cask/0.7.2_1/cask.el")
(cask-initialize)

(recentf-mode 1)
(key-chord-mode 1)

;; first cunch of unsused stuff

(eval-when-compile
  (require 'use-package))
(require 'diminish)     
(require 'bind-key)

(use-package winner
  :config
  (winner-mode 1))

(use-package uniquify)

(use-package auto-complete
  :init
  (setq ac-use-menu-map t)
  :config
  (progn
    (auto-complete-mode 1)
    (global-auto-complete-mode)
    (ac-config-default)
    (setq ac-use-fuzzy t)
    
    (setq ac-delay 0.025))

  :diminish auto-complete-mode
  :bind
  (("C-<up>" . ac-quick-help-scroll-up)
   ("C-<down>" . ac-quick-help-scroll-down)))

(use-package helm
  :config
  (progn
    (require 'helm-config)
    (use-package projectile
      :config
      (projectile-global-mode))
    (use-package helm-projectile)
    (use-package helm-ls-git)
    (use-package helm-bind-key)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0         ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things reeeelatively quickly.
          helm-quick-update t
          helm-adaptive-mode t
          helm-bookmark-show-location t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t
          helm-buffer-max-length 30)
    (helm-mode)
    (helm-flx-mode +1))
  :bind (("C-x C-f" . helm-find-files)
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

;; (load-theme 'base16-brewer-light t)
;; (load-theme ')
(setq ring-bell-function 'ignore)
(toggle-word-wrap 1)

;; (setq redisplay-dont-pause t)

;; add newline to file on save
(setq require-final-newline t)
;; font color and size
(set-face-attribute 'default nil :family "monaco" :height 120)
(blink-cursor-mode 1)
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
  (("C-x C-n" . my-next-edit)
   ("C-x C-p" . my-previous-edit)
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
  :config
  (setq-default js2-basic-offset 2)
  (js2-imenu-extras-setup))

(use-package ruby-mode
  :mode
  (("\\.rake\\'" . ruby-mode)
   ("\\Rakefile\\'" . ruby-mode)
   ("\\Gemfile\\'" . ruby-mode)
   ("\\.gemspec\\'" . ruby-mode)))

(use-package coffee-mode
  :config
  (setq coffee-tab-width 2))
;; (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2)
;; ;; (custom-set-variables '(coffee-tab-width 2))

(use-package css-mode)
(use-package scss-mode
  :config
  ;; disable scss-mode from compiling on save
  (setq scss-compile-at-save nil))

(use-package rainbow-mode
  :init
  (progn
    (add-hook 'css-mode-hook 'rainbow-mode)
    (add-hook 'scss-mode-hook 'rainbow-mode)
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
                (require 'flyspell-lazy)
                (visual-line-mode t)
                (flyspell-lazy-mode 1)
                (flyspell-mode 1)))
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

(toggle-indicate-empty-lines)
(setq show-paren-mode 1)
(setq show-trailing-whitespace nil)
;; (set-background-color "white")
(set-face-attribute 'region nil :background "lightblue")
(set-border-color "red")


(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'emms-setup)
(require 'emms-player-mplayer)
(emms-standard)
(emms-default-players)
(emms-playing-time-enable-display)
(define-emms-simple-player mplayer '(file url)
  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
                ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
(require 'emms-playing-time)
(emms-playing-time 1)


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


;; ;; (use-package ledger-mode
;; ;;   :init
;; ;;   (progn
;; ;;     (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))))

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
(use-package vc-git)
(use-package repository-root)

(set-exec-path-from-shell-PATH)

(find-file "~/.emacs.d/init.el")

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))

;; (flycheck-define-checker jsxhint-checker
;;   "A JSX syntax and style checker based on JSXHint."

;;   :command ("jsxhint" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;   :modes (web-mode))

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'jsxhint-checker)
;;               (flycheck-mode))))

;; (setq jsx-indent-level 2)

;; (global-linum-mode 1)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

(emms-cache-enable)

(use-package rvm
  :config
  (rvm-use-default))


(use-package web-mode)
