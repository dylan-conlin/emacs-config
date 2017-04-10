(package-initialize)

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

;; prefer spaces over tabs
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
  (projectile-mode))

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
    (setq helm-M-x-fuzzy-match nil)
    (setq helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match    t)
    (setq helm-semantic-fuzzy-match nil
          helm-imenu-fuzzy-match    nil)
    (helm-mode 1)
    )
  :bind (("C-x C-f" . helm-find-files)
         ("C-x l" . helm-ls-git-ls)
         ("C-x a" . helm-apropos)
         ("M-x" . helm-M-x)
         ("M-k" . my-helm-project-search)
         ("M-K" . my-helm-do-ag)
         ("C-c M-K" . helm-do-ag)
         ("C-c p p" . helm-projectile-switch-project)
         ("C-x b" . helm-projectless-search)
         ("C-c f" . helm-projectile-recentf)
         ("C-x p f" . helm-projectile-recentf)
         ("H-n" . helm-scroll-other-window)
         ("H-p" . helm-scroll-other-window-down)
         ("C-x t" . helm-imenu)
         ("M-C-p" . helm-eshell-history)
         ("C-x f" . helm-recentf)
         ("C-x y" . helm-show-kill-ring)
         ("C-x C-b" . helm-bookmarks)
         ("M-." . helm-locate)
         ("M-j" . helm-resume)))

(use-package yasnippet
  :diminish yas-minor-mode
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :bind
  (("s-e" . yas-expand))
  :init
  (progn
    (setq yas-verbosity 3)
    (yas-global-mode 1)
    
    )
;;   :bind
  ;;(("C-x j". helm-yas-complete))
  )

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
   ("s-P" . mc/unmark-next-like-this)
   ("s-p" . mc/mark-previous-like-this)
   ("s-N" . mc/unmark-previous-like-this)
   ("C-S-c C-S-c" . mc/edit-lines)))

(use-package color-theme
  :config
  (load-theme 'leuven t)
  ;; '(hl-line ((t (:background "gray96"))))
  ;; (load-theme 'leuven)

  ;; Keep emacs Custom-settings in separate file
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file))


(setq ring-bell-function 'ignore)
(toggle-word-wrap 1)

(setq redisplay-dont-pause t)

;; add newline to file on save
(setq require-final-newline t)
;; font color and size
(set-face-attribute 'default nil :family "Operator Mono" :height 140 :weight 'light)

;; (set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'light)
;; font for all unicode characters
(set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

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
  (("C-x C-n" . my-next-edit)
   ("C-x C-p" . my-previous-edit)
   ("C-x C-r" . git-gutter:revert-hunk)
   ("C-x C-d" . git-gutter:popup-hunk)))

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

(use-package expand-region
  :bind
  (("C-j" . er/expand-region))
  )

(use-package js-mode
  :mode
  (("\\.json\\'" . js-mode)
   ("\\.babelrc\\'" . js-mode)))

(use-package js2-mode
  :mode
  (;("\\.js\\'" . js2-mode)
   ;("\\.jsx$" . js2-mode)
   )
  :interpreter "node"
  ;; :no-require t
  :config
  (setq-default js2-global-externs '("describe" "it" "module" "require" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
  (setq-default js2-basic-offset 2)
  (js2-imenu-extras-setup))

;; (eval-after-load 'progn
;;   '(tern
;;     (require 'tern-auto-complete)
;;     (tern-ac-setup)))

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

(use-package css-mode)
(use-package scss-mode
  :config
  ;; disable scss-mode from compiling on save
  (setq scss-compile-at-save nil))

(use-package sass-mode)
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

;; (use-package lastpass
;;   :config
;;   ;; Set lastpass user
;;   (setq lastpass-user "dylan.conlin@gmail.com")
;;   (setq lastpass-multifactor-use-passcode t)
;;   ;; Enable lastpass custom auth-source
;;   (lastpass-auth-source-enable))

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
                (visual-line-mode nil)
                (yas-global-mode nil)
                ;; (flyspell-lazy-mode 1)
                ;; (flyspell-mode 1)
                ))

    ;; prettier appearance settings
    (setq org-log-done t)
    (setq org-todo-keywords
          '((sequence "TODO" "REVIEW" "DONE")))
    
    (setq org-todo-keyword-faces
          '(("TODO" . "red3")
            ("REVIEW" . "orange3")
            ("DONE" . "green4")
            ("ARCHIVED" .  "blue3")))
    
    (setq org-startup-indented t)
    (setq org-hide-leading-starts t)

    ;; behavior settings
    (setq org-use-fast-todo-selection t)

    ;; setup org path
    (setq org-default-notes-file (expand-file-name "~/Dropbox/org/notes.org"))

    ;; setup files agenda is aware of
    (setq my-org-agenda-files
          (f-entries "~/Dropbox/org/" (lambda (file) (not (s-matches? ".git" file)))))
    ;; (setq org-agenda-files '(
    ;;                          ;; "~/Dropbox/org/code.org"
    ;;                          "~/Dropbox/org/notes.org"
    ;;                          "~/Dropbox/org/shortstack.org"
    ;;                          ;; "~/Dropbox/org/journal.org"
    ;;                          "~/Dropbox/org/todo-personal.org"
    ;;                          "~/Dropbox/org/todo-work.org"
    ;;                          "~/Dropbox/org/todo-consulting.org"
    ;;                          "~/Dropbox/org/campaign-code.org"
    ;;                          ))
    (setq org-capture-templates
          '(
            ("t" "Todo-Work" entry (file+headline "~/Dropbox/org/todo-work.org" "Work") "* TODO %^{title} %^g \n %? \n%U")
            ("p" "Todo-Personal" entry (file+headline "~/Dropbox/org/todo-personal.org" "Personal") "* TODO %^{title} %^g \n %? \n%U")
            ("e" "Todo-Consulting" entry (file+headline "~/Dropbox/org/todo-consulting.org" "Consulting") "* TODO %^{title} %^g \n %? \n%U")
            ("c" "Code" entry (file+nheadline "~/Dropbox/org/campaign-code.org" "Code") "* %^{title} %^g \n %? \n%U")
            ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes") "* %^{title} %^g \n %? \n%U")
            ;; ("r" "Secret" entry (file+headline "~/Dropbox/org/secrets.org" "Secrets") "* %^{title} %^g \n %? \n%U")
            ;; ("j" "Journal" entry (file+headline "~/Dropbox/org/journal.org" "Journal") "* %^{title} %^g \n %? \n%U")
            ;; ("l" "Ledger entries")
            ;; ("lc" "Cash" plain (file "~/Dropbox/org/main.ledger") "%(org-read-date) * %^{Payee} Expenses:%^{Account} %^{Amount}")
            ))
    (setq org-refile-targets
          ;; (f-entries "~/Dropbox/org/" (lambda (file) file))
            '(
             ("~/Dropbox/org/todo-work.org" . (:level . 1))
            ("~/Dropbox/org/todo-personal.org" . (:level . 1))
            ("~/Dropbox/org/todo-consulting.org" . (:level . 1))
            ("~/Dropbox/org/notes.org" . (:level . 1))
            ("~/Dropbox/org/campaign-code.org" . (:level . 1))
            )
          )
    ))

(setq org-clock-persist 'history)
;; fontify code in code blocks
(setq org-src-fontify-natively t)

(org-clock-persistence-insinuate)

(smartparens-global-mode)
(setq show-paren-mode nil)
(show-smartparens-global-mode +1)
(setq show-trailing-whitespace nil)
;; (set-background-color "white")

(set-border-color "red")

(setq exec-path (append exec-path '("/usr/local/bin")))

;; (add-to-list 'load-path "~/.emacs.d/emms/")
;; (add-to-list 'load-path "~/usr/local/bin/mp3info/")
;; (add-to-list 'load-path "~/bin/tmsu")

;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)
;; (setq emms-source-file-default-directory "~/Music/")
;; (setq emms-player-mplayer-command-name "/usr/local/bin/mplayer")
;; (setq emms-player-list '(emms-player-mplayer
;;                          emms-player-mpg321
;;                          emms-player-mpd))

;; (setq emms-info-auto-update t)
;; (setq emms-info-asynchronously t)
;; (setq debug-on-error t)
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

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

(use-package utilities-setup)
(use-package bindings-setup)
(use-package texter)
(use-package hydras)
(use-package vc-git)
(use-package repository-root)

(set-exec-path-from-shell-PATH)

(find-file "~/.emacs.d/init.el")

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(defun quicklisp-slime-setup ()
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/slime"))
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/slime/contrib"))
  (setq inferior-lisp-program "/usr/local/bin/ccl64")
  (setq slime-autodoc-mode t)
  (setq slime-net-coding-system 'utf-8-unix)
  (require 'slime)
  (slime-setup '(slime-repl slime-fancy)))

(use-package beacon
  :config
  (beacon-mode 1))

(use-package anzu
  :config
  (global-anzu-mode t))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.jinja\\'" . web-mode)
         ("\\.php\\'" . web-mode)
         (("\\.jsx$" . web-mode))
         ("\\.js$" . web-mode))
  :config
  (progn
    (setq web-mode-engines-alist
          '(("\\.jinja\\'"  . "django")))))

(use-package flycheck
  :commands flycheck-mode
  )

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))


;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  ;; (setq web-mode-indent-style 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)


(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(setq debug-on-error nil)

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; (when (locate-library "edit-server")
;;   (require 'edit-server)
;;   (setq edit-server-new-frame nil)
;;   (edit-server-start))

(crux-reopen-as-root-mode)


(require 'prettier-js)
(add-hook 'js-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'jscodefmt-before-save)))

(fringe-mode 1)
(set-face-attribute 'fringe nil :background "gray33")
(set-fringe-style '(1 . 1))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  :ensure)

;; (use-package evil
;;   :config
;;   (evil-mode 1)
;;   (evil-escape-mode 1)
;;   (global-evil-surround-mode 1)
;;   (evil-magit-init)
;;   (global-evil-matchit-mode)
;;   (global-evil-mc-mode)
;;   (evilnc-default-hotkeys)
;;   )

;; (setq evil-emacs-state-cursor '("red" box))
;; (setq evil-normal-state-cursor '("green3" box))
;; (setq evil-visual-state-cursor '("orange" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("blue" bar))
;; (setq evil-operator-state-cursor '("pink" hollow))

;; (global-set-key (kbd "C-g") 'evil-escape)


;; (require 'sublimity)
                                        ;(require 'sublimity-scroll)
;; (require 'sublimity-map)
;; ;; (require 'sublimity-attractive)
;; (sublimity-mode 1)
;; (setq sublimity-scroll-weight 5
;;       sublimity-scroll-drift-length 20)

;; (use-package rvm
;;   :config
;;   (rvm-use-default))

(point-undo)
