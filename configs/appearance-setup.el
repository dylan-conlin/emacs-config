;; theme
(load-theme 'lush t)
;; (load-file "/Users/dylanconlin/drive/dotfiles/.emacs.d/workaholic-theme.el")

(powerline-vim-theme)
;; TODO
 ;; '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 ;; '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 
;; font
(set-face-attribute 'default nil :family "monaco" :height 120)

;; only show bad whitespace
(setq whitespace-style '(face trailing tab lines newline empty space-before-tab indentation empty space-after-tab))

;; face
;; Enable all visualizations which use special faces. This element has a special meaning: if it is absent from the list, none of the other visualizations take effect except space-mark, tab-mark, and newline-mark.
;; trailing
;; Highlight trailing whitespace.
;; tabs
;; Highlight tab characters.
;; spaces
;; Highlight space and non-breaking space characters.
;; lines
;; Highlight lines longer than 80 lines. To change the column limit, customize the variable whitespace-line-column.
;; newline
;; Highlight newlines.
;; empty
;; Highlight empty lines.

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

(diminish 'visual-line-mode)
(after 'paredit '(diminish 'paredit-mode))
(after 'tagedit '(diminish 'tagedit-mode))
(after 'skewer-mode '(diminish 'skewer-mode))
(after 'skewer-css '(diminish 'skewer-css-mode))
(after 'skewer-html '(diminish 'skewer-html-mode))
(after 'guide-key '(diminish 'guide-key-mode))
(after 'autopair (diminish 'autopair-mode))
(after 'undo-tree (diminish 'undo-tree-mode))
(after 'auto-complete (diminish 'auto-complete-mode))
(after 'projectile (diminish 'projectile-mode))
(after 'yasnippet (diminish 'yas-minor-mode))
(after 'guide-key (diminish 'guide-key-mode))
(after 'eldoc (diminish 'eldoc-mode))
(after 'smartparens (diminish 'smartparens-mode))
(after 'company (diminish 'company-mode))
(after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
(after 'git-gutter+ (diminish 'git-gutter+-mode))
(after 'magit (diminish 'magit-auto-revert-mode))
(after 'color-identifiers-mode (diminish 'color-identifiers-mode))

;; cursor
(blink-cursor-mode 1)

;; helm
(setq helm-buffer-max-length 30)

;; mustang, lush
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
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("yellow" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(provide 'appearance-setup)
