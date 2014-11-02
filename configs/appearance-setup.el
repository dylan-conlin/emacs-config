;; theme
(load-theme 'flatui t)
;; (load-file "/Users/dylanconlin/drive/dotfiles/.emacs.d/workaholic-theme.el")

(powerline-vim-theme)

;; font
(set-face-attribute 'default nil :family "monaco" :height 120)

;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;; undo-tree
;; (push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
;; (push '("*git-gutter+-diff*" :height 0.3 :position bottom :noselect t) popwin:special-display-config)

;; modeline
(sml/setup t)
;; (sml/apply-theme 'respectful)
(add-to-list 'sml/replacer-regexp-list '("^~/.emacs.d/" ":EMACS:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack/" ":STACK:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack-server/" ":SERVER:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/drive/sites/shortstack-designer/" ":DESIGNER:") t)

(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))

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

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("forestgreen" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(provide 'appearance-setup)
