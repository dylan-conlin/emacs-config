;; remove menus, tool-bars, scroll bars, splash-screen, and startup-message
(menu-bar-mode -1)
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
(require 'pallet)
(server-start)
(put 'narrow-to-region 'disabled nil)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; this can't be moved any lower for some reason.
(require 'org-mobile)

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

;; need to be required first to enable
;; my custom setups
(require 'rainbow-mode)
(require 'point-undo)
(require 'dired-details+)
(require 'itail)

;; require custom configs
(require 'repository-root)
(require 'utilities-setup)
(require 'helm-setup)
(require 'dash-setup)
(require 'autocomplete-setup)
(require 'appearance-setup)
(require 'mac-setup)
(require 'bindings-setup)
(require 'hooks-setup)
(require 'mode-lists-setup)
(require 'evil-search-highlight-persist)
(require 'org-setup)
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

;; enable useful custom configs on demand
(after 'projectile
  (projectile-global-mode 1))

(after "undo-tree-autoloads"
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))


(after 'eshell-mode
  (require 'eshell-setup))

(after 'coffee-mode
  (require 'coffee-setup))

;; (undo-tree-mode 1)
(helm-mode 1)
;; (delete-selection-mode 1)
(smartparens-global-mode 1)
;; (global-whitespace-mode 1)
(global-git-gutter+-mode 1)
(win-switch-mode 1)
(auto-indent-mode 1)
(yas-global-mode 1)
(guide-key-mode 1)
(key-chord-mode 1)
(winner-mode 1)
(edit-server-start)
(global-color-identifiers-mode)

(after 'flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
  (setq flycheck-standard-error-navigation nil))

;; setup evil mode
(evil-mode 1)
(global-evil-surround-mode 1)
(global-evil-search-highlight-persist t)
(setq evil-leader/in-all-states 1)
(evil-leader-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; (when (display-graphic-p (selected-frame)
;;   (eval-after-load 'flycheck
;;     '(custom-set-variables
;;       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

;; default landing file after startup
(find-file "~/.emacs.d/init.el")

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)
