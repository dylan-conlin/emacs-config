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
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

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

(require 'eshell-setup)

;; (after 'eshell-mode
;;   (require 'eshell-setup))

(after 'coffee-mode
  (require 'coffee-setup))

;; (undo-tree-mode 1)
(helm-mode 1)
(delete-selection-mode 1)
;; (smartparens-global-mode 1)
;; (global-whitespace-mode 1)
(global-git-gutter+-mode 1)
(drag-stuff-global-mode 1)
(win-switch-mode 1)
(auto-indent-mode 1)
(yas-global-mode 1)
(guide-key-mode 1)
(key-chord-mode 1)
(winner-mode 1)
(edit-server-start)
;; (global-color-identifiers-mode)

;; (after 'flycheck
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
;;   (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
;;   (setq flycheck-standard-error-navigation nil))

;; (when (display-graphic-p (selected-frame)
;;   (eval-after-load 'flycheck
;;     '(custom-set-variables
;;       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

;; setup evil mode
;; (evil-mode 1)
;; (global-evil-surround-mode 1)
;; (global-evil-search-highlight-persist t)
;; (setq evil-leader/in-all-states 1)
;; (evil-leader-mode 1)
;; (evil-leader/set-leader ",")
;; (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; default landing file after startup
(setq popwin:close-popup-window-timer-interval 0.05)
(setq display-buffer-function 'popwin:display-buffer)
(push '("*compilation*" :height 40) popwin:special-display-config)

;; disable scss-mode from compiling on save
(setq scss-compile-at-save nil)

(require 'let-alist)
(add-to-list 'load-path "~/.emacs.d/configs/sx")
(add-to-list 'load-path "~/.emacs.d/configs/node-resolver/node-resolver.el")
(require 'sx-load)

(find-file "~/.emacs.d/init.el")

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

(setq exec-path (append exec-path '("/usr/local/bin")))
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(require 'emms-player-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)
(require 'emms-player-vlc)
(emms-all)

(emms-default-players)
(require 'emms-browser)
(require 'emms-history)
(emms-history-load)

(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))

(require 'emms-mark)

(setq emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music")

(define-emms-simple-player mplayer '(file url)
      (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
                    ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                    ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
      "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

(setq emms-track-description-function 'fg-emms-track-description)

(require 'auto-package-update)
(setq auto-package-update-interval 7)
(auto-package-update-maybe)
(global-subword-mode 1)
(setenv "NODE_NO_READLINE" "1")

(setq js2-global-externs '("$" "window" "tab_config" "jQuery" "_" "SST" "FB" "Modernizr" "localStorage" "require" "setInterval" "setTimeout"))
(require 'dired-sort)

(require 'appearance-setup)
(require 'saveplace)
(global-dummyparens-mode)

(elmacro-mode)
