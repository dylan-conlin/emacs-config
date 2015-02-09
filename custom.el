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
 '(ansi-term-color-vector
   [unspecified "#151718" "#CE4045" "#9FCA56" "#DCCD69" "#55B5DB" "#A074C4" "#55B5DB" "#D4D7D6"] t)
 '(auto-image-file-mode t)
 '(battery-mode-line-format " %p" t)
 '(blink-cursor-interval 0.25)
 '(coffee-tab-width 2)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-in-non-selected-windows t)
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "28590b1f3a827a16ec1f025b20c025a6e63b56b6c4223851c224c2e6cd1c1775" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "609a1521b4983dc1e1cc64fe57fe2fffd256e9058c95b8fc6bfae479ab8b0af3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(dired-dwim-target t)
 '(emms-cache-get-function (quote emms-cache-get))
 '(emms-cache-modified-function (quote emms-cache-dirty))
 '(emms-cache-set-function (quote emms-cache-set))
 '(emms-mode-line-format " %s ")
 '(emms-mode-line-mode-line-function (quote emms-mode-line-icon-function))
 '(emms-mode-line-titlebar-function (quote ignore))
 '(emms-playlist-default-major-mode (quote emms-playlist-mode))
 '(emms-playlist-update-track-function (quote emms-playlist-mode-update-track-function))
 '(emms-seek-seconds 15)
 '(emms-track-description-function (quote fg-emms-track-description))
 '(erc-track-position-in-mode-line t t)
 '(eshell-cd-shows-directory nil)
 '(eshell-cmpl-autolist t)
 '(eshell-highlight-prompt t)
 '(eshell-hist-ignoredups t)
 '(eshell-list-files-after-cd nil)
 '(eshell-prompt-regexp "^[^#$]*[#$] ")
 '(eshell-scroll-to-bottom-on-input (quote all))
 '(eshell-scroll-to-bottom-on-output (quote all))
 '(fci-rule-color "#f1c40f")
 '(fill-column 110)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(fringe-mode 6 nil (fringe))
 '(guide-key-mode t)
 '(guide-key/align-command-by-space-flag t)
 '(guide-key/idle-delay 0)
 '(guide-key/recursive-key-sequence-flag t)
 '(helm-M-x-always-save-history t)
 '(helm-M-x-reverse-history nil)
 '(helm-adaptive-history-file "~/.emacs.d/helm-adaptive-history")
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-ag-fuzzy-match t)
 '(helm-ag-source-type (quote one-line))
 '(helm-always-two-windows t)
 '(helm-bookmark-show-location t)
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*project(less)-search" "\\*project-search" "\\*magit-process")))
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
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-quick-update t)
 '(helm-swoop-pre-input-function
   (quote
    #[0 "\300\301!\207"
	[thing-at-point symbol]
	2 "

(fn)"]))
 '(helm-swoop-speed-or-color t)
 '(helm-truncate-lines t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
(--map
 (solarized-color-blend it "#fdf6e3" 0.25)
 (quote
  ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
'(highlight-tail-colors
(quote
 (("#eee8d5" . 0)
  ("#B4C342" . 20)
  ("#69CABF" . 30)
  ("#69B7F0" . 50)
  ("#DEB542" . 60)
  ("#F2804F" . 70)
  ("#F771AC" . 85)
  ("#eee8d5" . 100))))
'(hl-bg-colors
(quote
 ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
'(hl-fg-colors
(quote
 ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(ido-ubiquitous-fallback-completing-read-function (quote completing-read-default))
 '(isearch-lazy-highlight t)
 '(js2-missing-semi-one-line-override t)
 '(js2-strict-missing-semi-warning nil)
 '(lazy-highlight-initial-delay 0)
 '(linum-format " %7d ")
 '(magit-completing-read-function (quote magit-builtin-completing-read))
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face (quote magit-item-highlight))
 '(magit-use-overlays nil)
'(newsticker-url-list
(quote
 (("dissolve" "http://thedissolve.com/feeds/reviews/essential/" nil nil nil))))
'(org-agenda-files
(quote
 ("~/Dropbox/org/code.org" "~/Dropbox/org/notes.org" "~/Dropbox/org/shortstack.org" "~/Dropbox/org/todo.org")))
 '(org-default-notes-file "~/Dropbox/org/notes.org")
 '(org-directory "~/Dropbox/org/")
 '(org-from-is-user-regexp "\\<Dylan Conlin\\>")
 '(org-journal-dir "~/Dropbox/org/journal/")
 '(org-log-done t)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-inbox-for-pull "~/Dropbox/org/mobile.org")
 '(org-startup-indented t)
 '(package-build-verbose nil)
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-indexing-method (quote alien))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 100)
 '(recentf-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (lexical-binding . t))))
 '(scss-compile-at-save nil t)
 '(show-paren-delay 0.06)
 '(show-paren-mode t)
 '(slack-token (getenv "SLACK_TOKEN"))
 '(smartparens-global-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/replacer-regexp-list nil)
 '(sp-hybrid-kill-excessive-whitespace t)
 '(sp-show-pair-delay 0)
 '(sp-show-pair-from-inside t)
 '(sp-undo-pairs-separately t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#ecf0f1")
'(vc-annotate-color-map
(quote
 ((30 . "#e74c3c")
  (60 . "#c0392b")
  (90 . "#e67e22")
  (120 . "#d35400")
  (150 . "#f1c40f")
  (180 . "#d98c10")
  (210 . "#2ecc71")
  (240 . "#27ae60")
  (270 . "#1abc9c")
  (300 . "#16a085")
  (330 . "#2492db")
  (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
'(weechat-color-list
(quote
 (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(whitespace-line-column 120)
 '(win-switch-feedback-background-color "green"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-header ((t (:foreground "gray60")))))
