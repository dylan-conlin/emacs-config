(progn
  
  ;; (when (fboundp 'scroll-bar-mode)
  ;;   (scroll-bar-mode -1))

  ;; (autoload 'zap-up-to-char "misc"
  ;;   "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  ;; (global-set-key (kbd "M-/") 'hippie-expand)
  ;; (global-set-key (kbd "C-x C-b") 'ibuffer)
  ;; (global-set-key (kbd "M-z") 'zap-up-to-char)

  ;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  ;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  ;; (global-set-key (kbd "C-M-s") 'isearch-forward)
  ;; (global-set-key (kbd "C-M-r") 'isearch-backward)

  ;; (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")))

(provide 'better-defaults)
