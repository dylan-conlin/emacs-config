(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")

(cask-initialize)
(require 'pallet)
(server-start)
(put 'narrow-to-region 'disabled nil)

;; Set up load path
(add-to-list 'load-path "~/.emacs.d/configs/")

;; setup node.js
(add-to-list 'load-path "~/.nvm/v0.11.14/bin/")
(add-to-list 'load-path "/usr/local/bin/markdown")

;; group backup files together to prevent clutter
(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
      
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; require custom configs
(require 'helm-setup)
(require 'use-package)
(require 'helm-projectile)
(require 'repository-root)
(require 'utilities)
(require 'autocomplete-setup)
(require 'appearance-setup)
(require 'mac-setup)
(require 'bindings-setup)
(require 'hooks)
(require 'point-undo)
(require 'coffee-setup)
(require 'node-setup)
(require 'mode-lists)
(require 'dired-details+)
(require 'smooth-scrolling)
(require 'rainbow-mode)
(require 'dash-setup)
(require 'markdown-mode)
(require 'itail)
(require 'popwin)
(require 'org-setup)
(require 'eshell-setup)
(require 'win-switch)

;; useful modes
(projectile-global-mode 1)
(undo-tree-mode 1)
(delete-selection-mode 1)
(smartparens-global-mode 1)
(global-whitespace-mode 1)
(global-git-gutter+-mode 1)
(win-switch-mode 1)
(helm-mode 1)
(auto-indent-mode 1)
(yas-global-mode 1)
(guide-key-mode 1)
(key-chord-mode 1)
(auto-fill-mode nil) ;; this is not working!
(winner-mode 1)
(edit-server-start)
;; (rainbow-turn-)

(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/guide-key-sequence '(("C-x p") ("M-r")))
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/idle-delay 0.1)
(setq ns-pop-up-frames nil)

(find-file "~/.emacs.d/init.el")
