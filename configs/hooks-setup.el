(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)

(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(remove-hook 'prog-mode-hook 'idle-highlight-mode)

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

(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; Switch the eimp minor mode on for all image-mode buffers
(add-hook 'image-mode-hook 'eimp-mode)
(add-hook 'coffee-mode-hook 'flycheck-mode 1)

(add-hook 'shell-mode-hook 'coffee-comint-filter nil t)

(defun coffee-comint-filter (string)
  (ansi-color-apply
   (replace-regexp-in-string "\x1b\\[.[GJK]" "" string)))


(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (add-hook 'magit-status-mode-hook
;; 	  (lambda () (face-remap-add-relative 'magit-item-highlight '())))

(add-hook 'kill-emacs-hook 'cache-last-open-file)


(provide 'hooks-setup)
