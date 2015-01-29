(require 'auto-complete-config)

(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/configs/dict/")
(auto-complete-mode t)
(setq ac-use-fuzzy t)
(setq ac-use-menu-map t)
(setq ac-delay 0.025)

;; (require 'pos-tip)
;; (defun jsj-ac-show-help ()
;;   "show docs for symbol at point or at beginning of list if not on a symbol"
;;   (interactive)
;;   (let ((s (save-excursion
;;              (or (symbol-at-point)
;;                  (progn (backward-up-list)
;;                         (forward-char)
;;                         (symbol-at-point))))))
;;     (pos-tip-show (if (equal major-mode 'emacs-lisp-mode)
;;                       (ac-symbol-documentation s)
;;                     (ac-slime-documentation (symbol-name s)))
;;                   'popup-tip-face
;;                   (point)
;;                   nil
;;                   -1)))


(provide 'autocomplete-setup)
