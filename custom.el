(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode coffee-mode haml-mode web-mode)))
 '(ag-highlight-search t)
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(auto-image-file-mode t)
 '(battery-mode-line-format " %p" t)
 '(blink-cursor-interval 0.25)
 '(coffee-tab-width 2)
 '(cursor-in-non-selected-windows nil)
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "609a1521b4983dc1e1cc64fe57fe2fffd256e9058c95b8fc6bfae479ab8b0af3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(dired-dwim-target t)
 '(erc-track-position-in-mode-line t t)
 '(eshell-cd-shows-directory nil)
 '(eshell-cmpl-autolist t)
 '(eshell-highlight-prompt nil t)
 '(eshell-hist-ignoredups t)
 '(eshell-list-files-after-cd nil)
 '(eshell-prompt-regexp "^[^#$]*[#$] " t)
 '(eshell-scroll-to-bottom-on-input (quote all))
 '(eshell-scroll-to-bottom-on-output (quote all))
 '(fill-column 110)
 '(global-git-gutter+-mode t)
 '(global-whitespace-mode t)
 '(helm-M-x-always-save-history t)
 '(helm-M-x-reverse-history nil)
 '(helm-adaptive-history-file "~/drive/dotfiles/.emacs.d/helm-adaptive-history")
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-always-two-windows t)
 '(helm-buffer-details-flag t)
 '(helm-buffer-max-length 30)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (nil))))
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-truncate-lines t)
 '(ido-ubiquitous-fallback-completing-read-function (quote completing-read-default))
 '(isearch-lazy-highlight t)
 '(lazy-highlight-initial-delay 0)
 '(magit-completing-read-function (quote magit-builtin-completing-read))
 '(newsticker-url-list
   (quote
    (("dissolve" "http://thedissolve.com/feeds/reviews/essential/" nil nil nil))))
 '(org-default-notes-file "~/drive/org/notes.org")
 '(org-directory "~/drive/org/")
 '(package-build-verbose nil)
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(show-paren-delay 0.125)
 '(show-paren-mode t)
 '(show-smartparens-global-mode nil)
 '(slack-token "xoxp-2151144447-2151498120-2155203918-21ecbe")
 '(smartparens-global-mode t)
 '(sml/mode-width (quote right))
 '(sp-show-pair-delay 0)
 '(sp-show-pair-from-inside t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "#2c3e50" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Monaco"))))
 '(ace-jump-face-foreground ((t (:background "#ecf0f1" :foreground "red" :inverse-video nil :underline nil))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :foreground "purple"))))
 '(helm-M-x-key ((t (:foreground "Magenta" :weight extra-bold))))
 '(helm-selection-line ((t (:background "lightgray"))))
 '(helm-source-header ((t (:weight bold :height 1.1 :family "Sans Serif"))))
 '(magit-section-title ((t (:background "white" :foreground "#2c3e50" :weight bold))))
 '(nxml-comment-content ((t (:inherit font-lock-comment-face))))
 '(nxml-element-local-name ((t (:inherit font-lock-function-name-face :foreground "darkred"))))
 '(nxml-text ((t (:foreground "blue"))) t)
 '(org-done ((t (:foreground "green3" :weight bold))))
 '(org-todo ((t (:foreground "indian red" :weight bold))))
 '(sml/charging ((t nil)))
 '(web-mode-symbol-face ((t (:inherit font-lock-constant-face :foreground "orange")))))


