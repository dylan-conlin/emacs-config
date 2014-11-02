(deftheme dylanconlin-light
  "Created 2014-09-17.")

(custom-theme-set-variables
 'dylanconlin-light
 '(ac-modes (quote (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode coffee-mode haml-mode web-mode)))
 '(dired-dwim-target t)
 '(helm-buffer-details-flag nil)
 '(helm-completing-read-handlers-alist (quote ((describe-function . helm-completing-read-symbols) (describe-variable . helm-completing-read-symbols) (debug-on-entry . helm-completing-read-symbols) (find-function . helm-completing-read-symbols) (find-tag . helm-completing-read-with-cands-in-buffer) (ffap-alternate-file) (tmm-menubar) (nil))))
 '(helm-truncate-lines t)
 '(ido-ubiquitous-fallback-completing-read-function (quote completing-read-default))
 '(package-build-verbose nil)
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 '(sml/mode-width (quote right))
 '(projectile-global-mode t)
 '(auto-image-file-mode t)
 '(coffee-tab-width 2)
 '(custom-safe-themes (quote ("609a1521b4983dc1e1cc64fe57fe2fffd256e9058c95b8fc6bfae479ab8b0af3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))

(custom-theme-set-faces
 'dylanconlin-light
 '(magit-item-highlight ((t (:background "gray97"))))
 '(sml/client ((t (:inherit sml/prefix))))
 '(sml/global ((t (:inverse-video nil))))
 '(sml/process ((t (:inherit sml/prefix))))
 '(sml/prefix ((t (:inherit sml/global :foreground "blue" :weight bold))))
 '(mode-line ((t (:background "lightgreen" :foreground "black" :inverse-video nil :box (:line-width -1 :style released-button)))))
 '(font-lock-variable-name-face ((t (:foreground "#e69f00"))))
 '(helm-match ((t (:foreground "red" :weight extra-bold))))
 '(helm-selection ((t (:inverse-video nil :weight bold :background "palegreen1"))))
 '(helm-selection-line ((t (:background "lightblue1" :underline t))))
 '(helm-source-header ((t (:weight bold :height 1.1 :family "Sans Serif"))))
 '(highlight ((t nil))))

(provide-theme 'dylanconlin-light)
