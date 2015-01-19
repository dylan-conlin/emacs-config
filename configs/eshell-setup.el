;; ;; customize eshell look and feel

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

;; (setq eshell-hist-ignoredups t)

;; (add-hook 'eshell-mode-hook
;;           '(lambda ()
;;              (rvm-activate-corresponding-ruby)))

;; (add-hook 'eshell-mode-hook
;; 	  (lambda ()
;; 	    (defun eshell-emit-prompt ()
;; 	      "Emit a prompt if eshell is being used interactively. I
;; am redefining it here so that it doesn't screw up my colors"
;; 	      (run-hooks 'eshell-before-prompt-hook)
;; 	      (if (not eshell-prompt-function)
;; 		  (set-marker eshell-last-output-end (point))
;; 		(let ((prompt (funcall eshell-prompt-function)))
;; 		  (and eshell-highlight-prompt
;; 		       (add-text-properties 0 (length prompt)
;; 					    '(read-only t
;; 							;; face eshell-prompt
;; 							rear-nonsticky (face read-only))
;; 					    prompt))
;; 		  (eshell-interactive-print prompt)))
;; 	      (run-hooks 'eshell-after-prompt-hook))))

;; (defun curr-dir-git-branch-string (pwd)
;;   "Returns current git branch as a string, or the empty string if
;; PWD is not in a git repo (or the git command is not found)."
;;   (interactive)
;;   (if (and (eshell-search-path "git")
;; 	   (locate-dominating-file pwd ".git"))
;;       (let ((git-output (shell-command-to-string (concat "git branch | grep '\\*' | sed -e 's/^\\* //'"))))
;; 	(propertize
;; 	 (concat "[±:"
;; 		 (if (> (length git-output) 0)
;; 		     (substring git-output 0 -1)
;; 		   "no branch")
;; 		 "]")
;; 	 'face `(:foreground "#D1D62D")))
;;     (propertize
;;      "[±]" 'face `(:foreground "#555555"))))
;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat (curr-dir-git-branch-string (eshell/pwd))
;;                 " "
;;                 (abbreviate-file-name (eshell/pwd)) " "
;;                 "$ ")))

;; (setq eshell-highlight-prompt t)

;; (setq eshell-prompt-regexp " \$ ")

;; (add-hook 'eshell-mode-hook
;;           (function
;;            (lambda ()

;;              (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

(defadvice shell (before advice-utf-shell activate)
  (set-default-coding-systems 'utf-8))

(provide 'eshell-setup)
