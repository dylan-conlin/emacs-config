(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-candidate-menu-min 2)
 '(ac-dwim nil)
 '(ac-expand-on-auto-complete t)
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode coffee-mode haml-mode web-mode)))
 '(ac-quick-help-height 30)
 '(ac-quick-help-prefer-pos-tip nil)
 '(ac-show-menu-immediately-on-auto-complete nil)
 '(ac-trigger-key "TAB")
 '(ag-highlight-search t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(ansi-term-color-vector
   [unspecified "#ffffff" "#ed6a43" "#183691" "#795da3" "#795da3" "#a71d5d" "#795da3" "#333333"] t)
 '(auto-image-file-mode t)
 '(aw-background t)
 '(battery-mode-line-format " %p")
 '(blink-cursor-blinks 2000)
 '(blink-cursor-delay 0)
 '(blink-cursor-interval 0.1)
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-in-non-selected-windows t)
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "ad9747dc51ca23d1c1382fa9bd5d76e958a5bfe179784989a6a666fe801aadf2" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "807a7f4c2d0d331fc1798e6d38b890ce3582096b8d622ba3b491b2aa4345e962" "130319ab9b4f97439d1b8fd72345ab77b43301cf29dddc88edb01e2bc3aff1e7" "51897d0e185a9d350a124afac8d5e95cda53e737f3b33befc44ab02f2b03dab1" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "fad38808e844f1423c68a1888db75adf6586390f5295a03823fa1f4959046f81" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "70340909b0f7e75b91e66a02aa3ad61f3106071a1a4e717d5cdabd8087b47ec4" "6998bd3671091820a6930b52aab30b776faea41449b4246fdce14079b3e7d125" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "d9db2602073498bfa3d591e2ce70de3e9c144c30aeacf9e667b0fb9139f38f50" "5d8caed7f4ed8929fd79e863de3a38fbb1aaa222970b551edfd2e84552fec020" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "28590b1f3a827a16ec1f025b20c025a6e63b56b6c4223851c224c2e6cd1c1775" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "609a1521b4983dc1e1cc64fe57fe2fffd256e9058c95b8fc6bfae479ab8b0af3" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(dired-dwim-target t)
 '(emms-cache-get-function (quote emms-cache-get))
 '(emms-cache-modified-function (quote emms-cache-dirty))
 '(emms-cache-set-function (quote emms-cache-set))
 '(emms-mode-line-format " %s ")
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")) t)
 '(emms-mode-line-mode-line-function (quote emms-mode-line-icon-function))
 '(emms-seek-seconds 15)
 '(enh-ruby-deep-indent-paren nil)
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
                         (:color "#808080"))
     (implicitParams :underline
                     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(erc-track-position-in-mode-line t)
 '(eshell-cd-shows-directory nil)
 '(eshell-cmpl-autolist t)
 '(eshell-highlight-prompt t)
 '(eshell-hist-ignoredups t)
 '(eshell-list-files-after-cd nil)
 '(eshell-prompt-regexp "^[^#$]*[#$] ")
 '(eshell-scroll-to-bottom-on-input (quote all))
 '(eshell-scroll-to-bottom-on-output (quote all))
 '(evil-shift-width 2)
 '(fci-always-use-textual-rule t)
 '(fci-rule-color "dark gray")
 '(fill-column 110)
 '(flycheck-pos-tip-timeout 3)
 '(flycheck-ruby-rubocop-executable "/Users/dylanconlin/.rvm/gems/ruby-2.3.1/bin/rubocop")
 '(flycheck-temp-prefix ".flycheck")
 '(git-gutter:hide-gutter nil)
 '(global-anzu-mode nil)
 '(global-flycheck-mode t)
 '(global-git-gutter-mode t)
 '(global-hl-line-mode nil)
 '(global-linum-mode nil)
 '(global-undo-tree-mode t)
 '(gnus-logo-colors (quote ("#1ec1c4" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(guide-key/align-command-by-space-flag t)
 '(guide-key/idle-delay 0)
 '(guide-key/recursive-key-sequence-flag t)
 '(helm-M-x-always-save-history t)
 '(helm-M-x-fuzzy-match nil)
 '(helm-M-x-requires-pattern nil)
 '(helm-M-x-reverse-history nil)
 '(helm-adaptive-history-file "~/.emacs.d/helm-adaptive-history")
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-ag-fuzzy-match nil)
 '(helm-ag-insert-at-point t)
 '(helm-ag-source-type (quote one-line))
 '(helm-ag-use-agignore t)
 '(helm-always-two-windows t)
 '(helm-bookmark-show-location t)
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*project(less)-search" "\\*project-search" "\\*magit-process")))
 '(helm-buffer-details-flag t)
 '(helm-buffer-max-length 60)
 '(helm-buffers-fuzzy-matching nil)
 '(helm-candidate-number-limit 100)
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
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-skip-boring-files t)
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-flx-mode t)
 '(helm-fuzzy-matching-highlight-fn (quote helm-flx-fuzzy-highlight-match))
 '(helm-fuzzy-sort-fn (quote helm-flx-fuzzy-matching-sort))
 '(helm-idle-delay 0.01 t)
 '(helm-imenu-fuzzy-match nil t)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mode t)
 '(helm-persistent-action-use-special-display nil)
 '(helm-quick-update t t)
 '(helm-recentf-fuzzy-match nil)
 '(helm-reuse-last-window-split-state t)
 '(helm-swoop-pre-input-function
   (quote
    #[0 "\300\301!\207"
        [thing-at-point symbol]
        2 "
(fn)"]))
 '(helm-swoop-speed-or-color t)
 '(helm-truncate-lines t t)
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
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(hl-sexp-background-color "#efebe9")
 '(ido-ubiquitous-fallback-completing-read-function (quote completing-read-default))
 '(indicate-buffer-boundaries nil)
 '(isearch-lazy-highlight t)
'(js2-global-externs
(quote
 ("describe" "it" "module" "require" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "SSMGR")))
 '(js2-include-node-externs t)
 '(js2-indent-switch-body t)
 '(js2-missing-semi-one-line-override t)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(json-reformat:indent-width 2)
 '(lazy-highlight-initial-delay 0)
 '(linum-format " %d ")
 '(magit-completing-read-function (quote magit-builtin-completing-read))
 '(magit-diff-arguments (quote ("--no-ext-diff")))
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face (quote magit-item-highlight))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-use-overlays nil)
 '(mpc-mpd-music-directory "/Users/dylanconlin/Music/iTunes/")
 '(neo-auto-indent-point nil)
 '(neo-show-hidden-files t)
 '(neo-smart-open t)
 '(neo-theme (quote ascii))
 '(neo-window-width 35)
'(newsticker-url-list
(quote
 (("dissolve" "http://thedissolve.com/feeds/reviews/essential/" nil nil nil))))
'(org-agenda-files
(quote
 ("~/Dropbox/org/notes.org" "~/Dropbox/org/shortstack.org")))
 '(org-auto-align-tags nil)
'(org-babel-load-languages
(quote
 ((emacs-lisp . t)
  (ruby . t)
  (js . t)
  (clojure . t)
  (sql . t)
  (gnuplot . t)
  (sh . t))))
 '(org-default-notes-file "~/Dropbox/org/notes.org")
 '(org-directory "~/Dropbox/org/")
 '(org-from-is-user-regexp "\\<Dylan Conlin\\>")
 '(org-journal-dir "~/Dropbox/org/journal/")
 '(org-log-done t)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-inbox-for-pull "~/Dropbox/org/mobile.org")
 '(org-startup-indented t)
 '(org-tags-column 0)
 '(org-todo-keywords (quote ((sequence "TODO" "REVIEW" "DONE"))))
 '(package-build-verbose nil)
'(package-selected-packages
(quote
 (evil dakrone-light-theme company-inf-ruby fold-dwim company-quickhelp selected 4clojure redo+ undohist expand-region indium paredit lastpass dumb-jump flycheck-rust rust-mode helm-spotify-plus evil-exchange evil-magit evil-matchit evil-mc evil-nerd-commenter evil-org evil-surround fontawesome helm evil-escape projectile-ripgrep ripgrep beacon helm-c-yasnippet hacker-typer autothemer xwidgete docker crux goto-last-change all-the-icons-dired rjsx-mode anzu zop-to-char zonokai-theme zenburn-theme zen-and-art-theme yasnippet yaml-mode window-purpose win-switch which-key web-mode warm-night-theme wanderlust waher-theme visual-regexp vimrc-mode vi-tilde-fringe vagrant-tramp use-package underwater-theme ujelly-theme ubuntu-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tommyh-theme tern-auto-complete tangotango-theme tango-plus-theme tango-2-theme swiper-helm svg-mode-line-themes sunny-day-theme sublimity sublime-themes subatomic256-theme subatomic-theme speed-type sparkline spaceline spacegray-theme soundklaus soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smooth-scroll smex smart-mode-line-powerline-theme slime simple-httpd shell-pop seti-theme scss-mode sass-mode rvm ruby-test-mode ruby-hash-syntax ruby-block reverse-theme restclient request-deferred rainbow-mode rails-log-mode purple-haze-theme professional-theme prodigy point-undo planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-projectile persp-mode per-buffer-theme pdf-tools pastels-on-dark-theme paradox pallet organic-green-theme org-journal org-beautify-theme olivetti oldlace-theme occidental-theme obsidian-theme nyan-mode nvm nodejs-repl noctilux-theme niflheim-theme neotree naquadah-theme names mustang-theme multiple-cursors multi-eshell monokai-theme monochrome-theme molokai-theme moe-theme minitest minimal-theme material-theme mark-multiple lush-theme lua-mode litable light-soap-theme leuven-theme ledger-mode kurecolor kite key-chord jsx-mode json-mode js2-mode jazz-theme jade-mode itail ir-black-theme inkpot-theme inf-ruby indent-guide import-js httprepl heroku-theme hemisu-theme helm-themes helm-swoop helm-projectile helm-package helm-open-github helm-mu helm-ls-git helm-itunes helm-hoogle helm-gtags helm-fuzzier helm-flycheck helm-flx helm-emms helm-descbinds helm-dash helm-commandlinefu helm-cmd-t helm-circe helm-bind-key helm-ag hc-zenburn-theme guide-key gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-contacts golden-ratio gmail-message-mode gitignore-mode github-clone github-browse-file git-timemachine git-gutter git-gutter+ gist gandalf-theme fzf focus flymake-coffee flycheck-tip flycheck-pos-tip flatui-theme flatland-theme firebelly-theme fastdef exec-path-from-shell espresso-theme eshell-did-you-mean esh-help ert-runner ert-expectations emms-player-mpv elmacro el-pocket eimp edit-server drag-stuff dracula-theme dockerfile-mode django-theme distinguished-theme display-theme discover-my-major direx dired-subtree dired-sort dired-single dired-ranger dired-rainbow dired-details+ dired+ dash-at-point darkmine-theme darkburn-theme darcula-theme dakrone-theme cyberpunk-theme cus-edit+ cursor-chg crontab-mode counsel corral comment-dwim-2 color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme cherry-blossom-theme calmer-forest-theme busybee-theme bubbleberry-theme browse-at-remote bongo bm birds-of-paradise-plus-theme basic-theme base16-theme badger-theme auto-package-update auto-indent-mode auto-compile atom-dark-theme arduino-mode apropospriate-theme applescript-mode anti-zenburn-theme ample-zen-theme ample-theme alert alect-themes ahungry-theme ag afternoon-theme adaptive-wrap ace-window ac-helm ac-cider)))
 '(paradox-automatically-star nil)
 '(paradox-github-token "9935f1b73d570a20fc348650741f836587963731")
 '(pos-tip-use-relative-coordinates t)
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-indexing-method (quote alien))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 100)
 '(red "#ffffff")
 '(ruby-block-delay 0)
 '(ruby-block-highlight-toggle t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (lexical-binding . t))))
 '(scss-compile-at-save nil)
 '(send-mail-function (quote mailclient-send-it))
 '(sentence-end-double-space nil)
 '(sh-indentation 2)
 '(show-paren-delay 0.06)
 '(show-smartparens-global-mode t)
 '(show-trailing-whitespace nil)
 '(slack-token (getenv "SLACK_TOKEN"))
 '(smartparens-global-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(sml/replacer-regexp-list nil)
 '(sp-hybrid-kill-excessive-whitespace t)
 '(sp-show-pair-delay 0)
 '(sp-show-pair-from-inside t)
 '(sp-undo-pairs-separately t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(undo-tree-enable-undo-in-region nil)
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
 '(web-mode-attr-indent-offset nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
'(weechat-color-list
(quote
 (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(whitespace-line-column 300)
 '(win-switch-feedback-background-color "green"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(org-level-1 ((t (:background "white" :foreground "#3C3C3C" :overline nil :weight bold :height 1.3))))
 '(org-level-2 ((t (:background "white" :foreground "#123555" :overline nil :weight bold :height 1.0))))
 '(org-level-3 ((t (:background "white" :foreground "#123555" :weight bold :height 1.0))))
 '(org-todo ((t (:background "white" :foreground "#D8ABA7" :weight bold))))
 '(sp-show-pair-match-face ((t (:foreground "red2" :weight bold)))))
