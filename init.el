;; remove menus, tool-bars, scroll bars, splash-screen, and startup-message
(menu-bar-mode 1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; setup my packages
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

(use-package auto-compile
  :ensure t
  :init (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package winner
  :ensure t
  :defer t
  :idle (winner-mode 1))

(setq sentence-end-double-space nil)

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)
(add-hook 'image-mode-hook 'eimp-mode)
(add-hook 'coffee-mode-hook 'flycheck-mode 1)
(add-hook 'shell-mode-hook 'coffee-comint-filter nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'kill-emacs-hook 'cache-last-open-file)
(add-hook 'org-mode-hook
          (lambda ()
	    (require 'flyspell-lazy)
	    (visual-line-mode t)
	    (flyspell-lazy-mode 1)
            (flyspell-mode 1)))

(add-hook 'eshell-mode-hook (lambda () (yas-minor-mode nil)))
(add-hook 'haml-mode-hook (lambda ()
			    (setq comment-start "-# "
				  comment-end "")))

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.csv$" . org-mode))


(use-package helm
  :ensure helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (require 'helm-projectile)
    (require 'helm-cmd-t)
    (require 'helm-ls-git)
    (require 'helm-bind-key)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things reeeelatively quickly.
          helm-quick-update t
	  helm-adaptive-mode t
	  helm-bookmark-show-location t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t
          helm-buffer-max-length 30)
    (helm-mode ))
  :bind (("C-x C-f" . helm-find-files)
	 ("C-x l" . helm-ls-git-ls)
	 ("C-x a" . helm-apropos)
	 ("M-x" . helm-M-x)
	 ("M-k" . helm-project-search)
	 ("M-l" . helm-projectile)
	 ("C-x b" . helm-projectless-search)
	 ("C-x t" . helm-imenu)
	 ("s-p" . helm-scroll-other-window-down)
	 ("s-n" . helm-scroll-other-window)
	 ("M-j" . helm-resume)
	 ("M-P" . helm-list-elisp-packages)
	 ("M-C-p" . helm-eshell-history)
	 ("C-c f" . helm-dash)
	 ("C-x f" . helm-recentf)
	 ("C-x y" . helm-show-kill-ring)
	 ("C-x C-b" . helm-bookmarks)))

;; (use-package helm-descbinds
;;   :defer t
;;   :bind (("C-h b" . helm-descbinds)
;;          ("C-h w" . helm-descbinds)))

(use-package smart-mode-line
  :defer t
  :idle
  (progn
    (setq-default
     mode-line-format
     '("%e"
       mode-line-front-space
       mode-line-mule-info
       mode-line-client
       mode-line-modified
       mode-line-remote
       mode-line-frame-identification
       mode-line-buffer-identification
       "   "
       mode-line-position
       (vc-mode vc-mode)
       "  "
       mode-line-modes
       mode-line-misc-info
       mode-line-end-spaces))))

(use-package color-theme :ensure t)

(defun my/setup-light-theme ()
  (interactive)
  (load-theme 'flatui t)
  ;; only show bad whitespace
  (setq whitespace-style '(face trailing tab lines newline empty space-before-tab indentation empty space-after-tab))
  (setq dired-details-propagate-flag t)
  (setq redisplay-dont-pause t)
  (setq scroll-margin 5)
  (setq scroll-step 1)
  (setq scroll-conservatively 10000)
  (setq scroll-preserve-screen-position 1)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1) ;; keyboard scroll one line at a time
  (setq ring-bell-function 'ignore)
  (setq-default truncate-lines t)
  ;; evil cursor
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("yellow" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  (setq require-final-newline t)   ;; add newline to file on save
  (set-face-attribute 'default nil :family "monaco" :height 110)   ;; font color and size
  (blink-cursor-mode 1)
  (global-subword-mode 1)
  (delete-selection-mode 1)
  (drag-stuff-global-mode 1)
  (auto-indent-mode 1)
  (toggle-indicate-empty-lines)
  (setq show-trailing-whitespace t))

(eval-after-load 'color-theme
  '(when window-system
     (my/setup-light-theme)))

(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode)
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-relative-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :idle
  (progn
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)
    (setq guide-key/idle-delay 0)
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-x p" "M-r" "M-d"))
    (guide-key-mode 1)))

(prefer-coding-system 'utf-8)

(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

(use-package helm-swoop
  :defer t
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all))
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)))

(defun my/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))

(defun my/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))

(bind-key "C-x 2" 'my/vsplit-last-buffer)
(bind-key "C-x 3" 'my/hsplit-last-buffer)

(use-package expand-region
  :ensure expand-region
  :defer t
  :bind ("C-j" . er/expand-region))

(use-package "eldoc"
  :diminish eldoc-mode
  :commands turn-on-eldoc-mode
  :defer t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)))

(use-package js2-mode
  :ensure t
  :defer t
  :commands js2-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (setq-default js2-basic-offset 2)
    (add-hook 'js2-mode-hook 'javascript-doc)
    (add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode)))
  :config
  (progn
    (js2-imenu-extras-setup)
    (bind-key "C-x C-e" 'js-send-last-sexp js2-mode-map)
    (bind-key "C-M-x" 'js-send-last-sexp-and-go js2-mode-map)))

(use-package coffee-mode
  :ensure t
  :defer t
  :idle (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2)
  :config
  (add-hook 'coffee-mode-hook 'coffee-doc))

(use-package ruby-mode
  :ensure t
  :defer t
  :config
  (add-hook 'ruby-mode-hook 'ruby-doc)
  (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))


;; (custom-set-variables '(coffee-tab-width 2))

(use-package emms
  :ensure t
  :defer t
  :config
  (progn
    (require 'emms-setup)
    (require 'emms-player-mpd)
    (require 'emms-player-vlc)
    (require 'emms-browser)
    (require 'emms-history)
    (require 'emms-info-libtag)
    (require 'emms-mark)
    (setq emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music")
    (add-to-list 'emms-player-list 'emms-player-mpd)
    (emms-standard)
    (setq emms-info-functions '(emms-info-libtag))
    (define-emms-simple-player mplayer '(file url)
      (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
		    ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
		    ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
      "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
    (setq emms-track-description-function 'fg-emms-track-description)
    (emms-history-load))
  :bind (("C-x p e" . emms)))

(use-package rainbow-mode
  :ensure rainbow-mode
  :defer t
  :idle (rainbow-mode))

(use-package auto-complete
  :ensure auto-complete
  :defer t
  :bind
  (("C-<up>" . ac-quick-help-scroll-up)
   ("C-<down>" . ac-quick-help-scroll-down))
  :init
  (progn
    (auto-complete-mode t)
    (ac-config-default)
    (setq ac-use-fuzzy t)
    (setq ac-use-menu-map t)
    (setq ac-delay 0.025)))

(use-package pallet
  :ensure pallet
  :defer t
  :config
  (pallet-mode t))

(use-package point-undo
  :ensure t
  :defer t
  :bind
  (("M-/" . point-undo)
   ("M-." . point-redo)))

(use-package dired-details+
  :ensure t
  :defer t)

(use-package itail
  :ensure t
  :defer t)

(use-package bind-key
  :ensure t
  :defer t)

(use-package dired-sort
  :ensure t
  :defer t)

(use-package saveplace
  :ensure t
  :defer t
  :config
  (progn
    (setq save-place-file "~/.emacs.d/saveplace")
    (setq-default save-place t)))


(use-package eshell
  :ensure t
  :defer t
  :bind
  ("C-x p s" . start-eshell-in-split-window)
  :config
  (progn
    (set-exec-path-from-shell-PATH)
    (add-hook 'eshell-mode-hook
	      #'(lambda ()
		  (define-key eshell-mode-map
		    [remap eshell-pcomplete]
		    'helm-esh-pcomplete))))
  (defadvice shell (before advice-utf-shell activate)
    (set-default-coding-systems 'utf-8)))

(use-package org
  :defer t
  :bind
  (("C-S-n" . org-move-subtree-down)
   ("C-c c" . org-capture)
   ("C-c l" . org-capture-goto-last-stored)
   ("C-c a" . org-agenda))
  :config
  (progn
    (require 'org-install)
    (require 'org-crypt)
    (require 'gnus-async)
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
	    ;; ("o" "Contacts" entry (file "~/Dropbox/org/contacts.org") "* %(org-contacts-template-name)\n:PROPERTIES:\n%(org-contacts-template-email)\n:END:")
	    ;; ("e" "Email" entry (file+headline "~/Dropbox/org/emails.org" "Emails") "* %^{title} %^g \n %? \n%U")
	    ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes") "* %^{title} %^g \n %? \n%U")
	    ("r" "Secret" entry (file+headline "~/Dropbox/org/secrets.org" "Secrets") "* %^{title} %^g \n %? \n%U")
	    ("j" "Journal" entry (file+headline "~/Dropbox/org/journal.org" "Journal") "* %^{title} %^g \n %? \n%U")
	    ("s" "Shortstack" entry (file+headline "~/Dropbox/org/shortstack.org" "Shortstack") "* %^{title} %^g \n %? \n%U")
	    ("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Tasks") "* TODO %^{title} %^g \n %? \n%U")
	    ))
    (setq org-refile-targets
	  '(
	    ("~/Dropbox/org/notes.org" . (:level . 1))
	    ("~/Dropbox/org/todo.org" . (:level . 1))
	    ("~/Dropbox/org/shortstack.org" . (:level . 1))
	    ("~/Dropbox/org/secrets.org" . (:level . 1))
	    ("~/Dropbox/org/code.org" . (:level . 1))
	    ("~/Dropbox/org/blogs.org" . (:level . 1))))))


(smartparens-global-mode)

;; (use-package auto-package-update
;;   :ensure t
;;   :defer t
;;   :config )

;; (setq auto-package-update-interval 7)
;; (auto-package-update-maybe)

;; (use-package org-mobile
;;   :ensure t
;;   :defer t)
;(define-key org-mode-map "\C-cp" 'org-mobile-pull)
;(define-key org-agenda-mode-map "\C-cp" 'org-mobile-pull)

(projectile-global-mode 1)
(server-start)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

(require 'utilities-setup)
(require 'bindings-setup)

;; require custom configs
(require 'repository-root)

;; setup node.js
(add-to-list 'load-path "~/.nvm/current/bin/")
(add-to-list 'load-path "/usr/local/bin/markdown")

;; group backup files together to prevent clutter
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Use aspell for spell checking: brew install aspell --lang=en
;; /usr/local/Cellar/aspell/0.60.6.1
(setq ispell-program-name "/usr/local/bin/aspell")
(key-chord-mode 1)

;; disable scss-mode from compiling on save
(setq scss-compile-at-save nil)
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "NODE_NO_READLINE" "1")

(setq debug-on-error t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq-default indent-tabs-mode nil)

(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places"))

(find-file "~/.emacs.d/init.el")

(open-last-visited-file)
