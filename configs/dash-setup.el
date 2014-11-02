(defun ruby-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Ruby" "Ruby on Rails")))

(add-hook 'ruby-mode-hook 'ruby-doc)

(defun javascript-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "JQuery" "UnderscoreJS" "Jasmine"))) ;; add NodeJS

(add-hook 'js2-mode-hook 'javascript-doc)

(defun coffee-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CoffeeScript" "KnockoutJS" "UnderscoreJS" "Jasmine")))

(add-hook 'coffee-mode-hook 'coffee-doc)


(provide 'dash-setup)
