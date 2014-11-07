(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; turn off idle highlight mode (this is turned on by emacs starter kit package)
(remove-hook 'prog-mode-hook 'idle-highlight-mode)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; (add-hook 'org-mode-hook
;;        (lambda ()
;;          (toggle-word-wrap t)
;;          (toggle-truncate-lines nil)
;;          (csv-to-org-table)))

(add-hook 'org-mode-hook
          (lambda ()
	    (require 'flyspell-lazy)
	    (visual-line-mode t)
	    (flyspell-lazy-mode 1)
            (flyspell-mode 1)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (yas-minor-mode nil)))

;; (csv-to-org-table)

(add-hook 'haml-mode-hook
          (lambda ()
            ;; Preferred comment style
            (setq comment-start "-# "
                  comment-end "")))

(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

(add-hook 'js2-mode-hook 'ac-js2-mode)

(provide 'hooks-setup)
