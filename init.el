(menu-bar-mode 1)
;; remove menus, tool-bars, scroll bars, splash-screen, and startup-message
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

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'pallet)
(pallet-mode t)
(server-start)
(put 'narrow-to-region 'disabled nil)

(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

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
(require 'popwin)
(require 'bind-key)
;; require custom configs
(require 'repository-root)
(require 'utilities-setup)
(require 'helm-setup)
(require 'dash-setup)
(require 'autocomplete-setup)

(require 'mac-setup)
(require 'bindings-setup)
(require 'hooks-setup)
(require 'mode-lists-setup)

;; (require 'evil-search-highlight-persist)
(require 'org-setup)
(require 'queue-0.1.1)
(require 'dired-sort)

(require 'saveplace)
(require 'smartparens-config)

;; setup node.js
(add-to-list 'load-path "~/.nvm/current/bin/")
(add-to-list 'load-path "/usr/local/bin/markdown")
(add-to-list 'load-path "~/.emacs.d/configs/sx")

;; group backup files together to prevent clutter
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; enable useful custom configs on demand

(projectile-global-mode 1)


(global-undo-tree-mode t)
(setq undo-tree-visualizer-relative-timestamps t)
(setq undo-tree-visualizer-timestamps t)

(require 'eshell-setup)
(require 'coffee-setup)
(require 'emms-configuration)
(require 'auto-package-update)

;; (undo-tree-mode 1)
(helm-mode 1)
(delete-selection-mode 1)
;; (smartparens-global-mode 1)
;; (global-whitespace-mode 1)
(global-git-gutter+-mode 1)
(drag-stuff-global-mode 1)
;; (win-switch-mode 1)
(auto-indent-mode 1)
(yas-global-mode 1)
(guide-key-mode 1)
(key-chord-mode 1)
(winner-mode 1)
;; (global-color-identifiers-mode)

;; default landing file after startup
(setq popwin:close-popup-window-timer-interval 0.05)
(setq display-buffer-function 'popwin:display-buffer)
(push '("*compilation*" :height 40) popwin:special-display-config)
(push '("*help*" :width 0.5 :position right) popwin:special-display-config)

;; disable scss-mode from compiling on save
(setq scss-compile-at-save nil)

(require 'let-alist)
(require 'sx-load)

(setq save-place-file "~/.emacs.d/saveplace")

(setq-default save-place t)
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq auto-package-update-interval 7)
(auto-package-update-maybe)
(global-subword-mode 1)
(setenv "NODE_NO_READLINE" "1")

(smartparens-global-mode)

(elmacro-mode)
(require 'appearance-setup)

(setq indicate-empty-lines t)
(setq show-trailing-whitespace t)

(open-last-visited-file)
