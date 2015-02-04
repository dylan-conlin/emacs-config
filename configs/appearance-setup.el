;; theme
(load-theme 'gandalf t)

;; only show bad whitespace
(setq whitespace-style '(face trailing tab lines newline empty space-before-tab indentation empty space-after-tab))

;; ;; smart-mode-line
;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

;; (add-to-list 'sml/replacer-regexp-list '("^~/.emacs.d/" ":EMACS:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack/" ":STACK:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack-server/" ":SERVER:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack-designer/" ":DESIGNER:") t)

;; cursor
(blink-cursor-mode 1)


;; helm
(setq helm-buffer-max-length 30)
(setq dired-details-propagate-flag t)
(setq redisplay-dont-pause t)
(setq scroll-margin 5)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq ring-bell-function 'ignore)
(setq-default truncate-lines t)

;; evil cursor
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("yellow" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; add newline to file on save
(setq require-final-newline t)

;; font color and size
(set-face-attribute 'default nil :family "monaco" :height 110)

;; rainbow delimiters
(rainbow-delimiters-mode 1)

;; faces
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; region highlight color
(set-cursor-color "purple")
(set-face-attribute 'region nil :background "lightblue")
(set-face-attribute 'helm-selection nil :background "lightgreen")
(set-face-foreground 'font-lock-comment-face "gray65")
(set-face-attribute 'show-paren-match nil :background "red" :foreground "white")
(set-face-attribute 'isearch nil :foreground "yellow" :background "deep pink")
(set-face-attribute 'isearch-lazy-highlight-face nil :foreground "black" :background "lightblue")
(set-face-attribute 'rainbow-delimiters-unmatched-face nil :background nil :foreground "red")
(set-face-attribute 'mode-line nil :background "light green" :foreground "purple")

(provide 'appearance-setup)
