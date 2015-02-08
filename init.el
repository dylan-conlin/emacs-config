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
  (rainbow-delimiters-mode -1)
  (blink-cursor-mode 1))

(eval-after-load 'color-theme
  '(when window-system
     (my/setup-light-theme)))

(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :idle
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








(require 'pallet)
(pallet-mode t)
(server-start)

(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))









;; this can't be moved any lower for some reason.
(require 'org-mobile)

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

;; need to be required first to enable
;; my custom setups

(require 'utilities-setup)

(require 'autocomplete-setup)
(require 'bindings-setup)
(require 'rainbow-mode)
(require 'point-undo)
(require 'dired-details+)
(require 'itail)
;; (require 'popwin)

;; require custom configs
(require 'repository-root)
(require 'dash-setup)
(require 'mac-setup)
(require 'bind-key)
(require 'hooks-setup)
(require 'mode-lists-setup)

;; (require 'evil-search-highlight-persist)
(require 'org-setup)
(require 'dired-sort)
(require 'saveplace)
(require 'smartparens-config)

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

;; enable useful custom configs
(projectile-global-mode 1)

(require 'eshell-setup)
(require 'coffee-setup)
(require 'emms-configuration)
(require 'auto-package-update)

(delete-selection-mode 1)
(global-git-gutter+-mode 1)
(drag-stuff-global-mode 1)
(auto-indent-mode 1)
(key-chord-mode 1)

;; (setq popwin:close-popup-window-timer-interval 0.05)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (push '("*compilation*" :height 40) popwin:special-display-config)
;; (push '("*help*" :width 0.5 :position right) popwin:special-display-config)

;; disable scss-mode from compiling on save
(setq scss-compile-at-save nil)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq auto-package-update-interval 7)
(auto-package-update-maybe)
(global-subword-mode 1)
(setenv "NODE_NO_READLINE" "1")
(smartparens-global-mode)
;; (require 'appearance-setup)
(toggle-indicate-empty-lines)
(setq show-trailing-whitespace t)

(setq debug-on-error t)

(find-file "~/.emacs.d/init.el")
(open-last-visited-file)
