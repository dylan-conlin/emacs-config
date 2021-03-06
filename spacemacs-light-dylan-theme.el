(deftheme spacemacs-light-dylan
  "Created 2017-05-25.")

(custom-theme-set-variables
 'spacemacs-light-dylan
 '(ansi-color-names-vector ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"]))

(custom-theme-set-faces
 'spacemacs-light-dylan
 '(cursor ((((class color) (min-colors 89)) (:background "#100a14"))))
 '(custom-button ((((class color) (min-colors 89)) :background "#efeae9" :foreground "#655370" :box (:line-width 2 :style released-button))))
 '(error ((((class color) (min-colors 89)) (:foreground "#e0211d"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#2aa1ae" :background "#ecf3ec"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#4e3163"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#2aa1ae"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#6c3163" :inherit bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:inherit bold :foreground "#3a81c3"))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#4e3163"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#6c3163"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#2d9574"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#ba2f59" :inherit bold))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#715ab1"))))
 '(font-lock-warning-face ((t (:background "#fbf8ef" :foreground "#dc752f"))))
 '(fringe ((((class color) (min-colors 89)) (:background "#fbf8ef" :foreground "#655370"))))
 '(header-line ((((class color) (min-colors 89)) :background "#d2ceda")))
 '(highlight ((((class color) (min-colors 89)) (:foreground "#655370" :background "#d3d3e7"))))
 '(hl-line ((((class color) (min-colors 89)) (:background "#efeae9"))))
 '(isearch ((((class color) (min-colors 89)) (:foreground "#fbf8ef" :background "#ba2f59"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "#dae6d0" :weight normal))))
 '(link ((((class color) (min-colors 89)) (:foreground "#2aa1ae" :underline t))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#6c4173" :underline t))))
 '(match ((((class color) (min-colors 89)) (:background "#d3d3e7" :foreground "#ba2f59"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:inherit bold :foreground "#3a81c3"))))
 '(region ((((class color) (min-colors 89)) (:background "#d3d3e7"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#e3dedd"))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#a094a2"))))
 '(success ((((class color) (min-colors 89)) (:foreground "#42ae2c"))))
 '(tooltip ((((class color) (min-colors 89)) (:background "#c8c6dd" :foreground "#655370" :bold nil :italic nil :underline nil))))
 '(vertical-border ((((class color) (min-colors 89)) (:foreground "#b3b9be"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#dc752f"))))
 '(anzu-mode-line ((((class color) (min-colors 89)) (:foreground "#b1951d" :inherit bold))))
 '(company-echo-common ((((class color) (min-colors 89)) (:background "#655370" :foreground "#fbf8ef"))))
 '(company-preview ((((class color) (min-colors 89)) (:background "#e2e0ea" :foreground "#8c799f"))))
 '(company-preview-common ((((class color) (min-colors 89)) (:background "#e2e0ea" :foreground "#655370"))))
 '(company-preview-search ((((class color) (min-colors 89)) (:inherit match))))
 '(company-scrollbar-bg ((((class color) (min-colors 89)) (:background "#efeae9"))))
 '(company-scrollbar-fg ((((class color) (min-colors 89)) (:background "#d3d3e7"))))
 '(company-template-field ((((class color) (min-colors 89)) (:inherit region))))
 '(company-tooltip ((((class color) (min-colors 89)) (:background "#e2e0ea" :foreground "#8c799f"))))
 '(company-tooltip-annotation ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(company-tooltip-common ((((class color) (min-colors 89)) (:background "#e2e0ea" :foreground "#655370"))))
 '(company-tooltip-common-selection ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(company-tooltip-mouse ((((class color) (min-colors 89)) (:inherit highlight))))
 '(company-tooltip-search ((((class color) (min-colors 89)) (:inherit match))))
 '(company-tooltip-selection ((((class color) (min-colors 89)) (:background "#c8c6dd" :foreground "#655370"))))
 '(diff-added ((((class color) (min-colors 89)) :background nil :foreground "#67b11d")))
 '(diff-changed ((((class color) (min-colors 89)) :background nil :foreground "#3a81c3")))
 '(diff-header ((((class color) (min-colors 89)) :background "#ddd8eb" :foreground "#6c3163")))
 '(diff-file-header ((((class color) (min-colors 89)) :background "#ddd8eb" :foreground "#655370")))
 '(diff-indicator-added ((((class color) (min-colors 89)) :background nil :foreground "#67b11d")))
 '(diff-indicator-changed ((((class color) (min-colors 89)) :background nil :foreground "#3a81c3")))
 '(diff-indicator-removed ((((class color) (min-colors 89)) :background nil :foreground "#f2241f")))
 '(diff-refine-added ((((class color) (min-colors 89)) :background "#67b11d" :foreground "#d2ceda")))
 '(diff-refine-changed ((((class color) (min-colors 89)) :background "#3a81c3" :foreground "#d2ceda")))
 '(diff-refine-removed ((((class color) (min-colors 89)) :background "#f2241f" :foreground "#d2ceda")))
 '(diff-removed ((((class color) (min-colors 89)) :background nil :foreground "#f2241f")))
 '(dired-directory ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background "#fbf8ef" :inherit bold))))
 '(dired-flagged ((((class color) (min-colors 89)) (:foreground "#f2241f"))))
 '(dired-header ((((class color) (min-colors 89)) (:foreground "#6c4173" :inherit bold))))
 '(dired-ignored ((((class color) (min-colors 89)) (:inherit shadow))))
 '(dired-mark ((((class color) (min-colors 89)) (:foreground "#6c4173" :inherit bold))))
 '(dired-marked ((((class color) (min-colors 89)) (:foreground "#a31db1" :inherit bold))))
 '(dired-perm-write ((((class color) (min-colors 89)) (:foreground "#655370" :underline t))))
 '(dired-symlink ((((class color) (min-colors 89)) (:foreground "#21b8c7" :background "#fbf8ef" :inherit bold))))
 '(dired-warning ((t (:foreground "#dc752f"))))
 '(eldoc-highlight-function-argument ((((class color) (min-colors 89)) (:foreground "#ba2f59" :inherit bold))))
 '(flycheck-error ((((supports :underline (:style line)) (class color) (min-colors 89)) (:underline (:style line :color "#e0211d"))) (((class color) (min-colors 89)) (:foreground "#655370" :background "#e0211d" :inherit bold :underline t))))
 '(flycheck-error-list-checker-name ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(flycheck-fringe-error ((((class color) (min-colors 89)) (:foreground "#e0211d" :inherit bold))))
 '(flycheck-fringe-info ((((class color) (min-colors 89)) (:foreground "#3a81c3" :inherit bold))))
 '(flycheck-fringe-warning ((((class color) (min-colors 89)) (:foreground "#dc752f" :inherit bold))))
 '(flycheck-info ((((supports :underline (:style line)) (class color) (min-colors 89)) (:underline (:style line :color "#3a81c3"))) (((class color) (min-colors 89)) (:foreground "#655370" :background "#3a81c3" :inherit bold :underline t))))
 '(flycheck-warning ((((supports :underline (:style line)) (class color) (min-colors 89)) (:underline (:style line :color "#dc752f"))) (((class color) (min-colors 89)) (:foreground "#655370" :background "#dc752f" :inherit bold :underline t))))
 '(gnus-summary-cancelled ((((class color) (min-colors 89)) (:background "#dc752f" :foreground "#fbf8ef"))))
 '(helm-bookmark-directory ((((class color) (min-colors 89)) (:inherit helm-ff-directory))))
 '(helm-bookmark-file ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(helm-bookmark-gnus ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(helm-bookmark-info ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(helm-bookmark-man ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(helm-bookmark-w3m ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(helm-buffer-directory ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-buffer-file ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-buffer-not-saved ((((class color) (min-colors 89)) (:foreground "#6c4173" :background "#fbf8ef"))))
 '(helm-buffer-process ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background "#fbf8ef"))))
 '(helm-buffer-saved-out ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-buffer-size ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-candidate-number ((((class color) (min-colors 89)) (:background "#fbf8ef" :foreground "#3a81c3" :inherit bold))))
 '(helm-ff-directory ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background "#fbf8ef" :inherit bold))))
 '(helm-ff-dotted-directory ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background "#fbf8ef" :inherit bold))))
 '(helm-ff-dotted-symlink-directory ((((class color) (min-colors 89)) (:foreground "#21b8c7" :background "#fbf8ef" :inherit bold))))
 '(helm-ff-executable ((((class color) (min-colors 89)) (:foreground "#42ae2c" :background "#fbf8ef" :weight normal))))
 '(helm-ff-file ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef" :weight normal))))
 '(helm-ff-invalid-symlink ((((class color) (min-colors 89)) (:foreground "#f2241f" :background "#fbf8ef" :inherit bold))))
 '(helm-ff-prefix ((((class color) (min-colors 89)) (:foreground "#fbf8ef" :background "#3a81c3" :weight normal))))
 '(helm-ff-symlink ((((class color) (min-colors 89)) (:foreground "#21b8c7" :background "#fbf8ef" :inherit bold))))
 '(helm-grep-cmd-line ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-grep-file ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-grep-finish ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(helm-grep-lineno ((((class color) (min-colors 89)) (:foreground "#ba2f59" :background "#fbf8ef" :inherit bold))))
 '(helm-grep-match ((((class color) (min-colors 89)) (:foreground nil :background nil :inherit helm-match))))
 '(helm-header ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef" :underline nil :box nil))))
 '(helm-header-line-left-margin ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background nil))))
 '(helm-match ((((class color) (min-colors 89)) (:background "#edf1ed" :foreground "#3a81c3"))))
 '(helm-match-item ((((class color) (min-colors 89)) (:background "#edf1ed" :foreground "#3a81c3"))))
 '(helm-moccur-buffer ((((class color) (min-colors 89)) (:foreground "#715ab1" :background "#fbf8ef"))))
 '(helm-selection ((((class color) (min-colors 89)) (:background "#d3d3e7"))))
 '(helm-selection-line ((((class color) (min-colors 89)) (:background "#efeae9"))))
 '(helm-separator ((((class color) (min-colors 89)) (:foreground "#6c4173" :background "#fbf8ef"))))
 '(helm-source-header ((((class color) (min-colors 89)) (:background "#6c4173" :foreground "#fbf8ef" :inherit bold))))
 '(helm-visible-mark ((((class color) (min-colors 89)) (:foreground "#3a81c3" :background "#e3dedd"))))
 '(hydra-face-blue ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(hydra-face-red ((((class color) (min-colors 89)) (:foreground "#f2241f"))))
 '(ido-first-match ((((class color) (min-colors 89)) (:foreground "#6c4173" :inherit bold))))
 '(ido-only-match ((((class color) (min-colors 89)) (:foreground "#ba2f59" :inherit bold))))
 '(ido-subdir ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(info-header-xref ((((class color) (min-colors 89)) (:foreground "#6c3163" :underline t))))
 '(info-node ((((class color) (min-colors 89)) (:foreground "#6c3163" :inherit bold))))
 '(info-title-1 ((((class color) (min-colors 89)) (:height 1.4 :inherit bold))))
 '(info-title-2 ((((class color) (min-colors 89)) (:height 1.3 :inherit bold))))
 '(info-title-3 ((((class color) (min-colors 89)) (:height 1.3))))
 '(info-title-4 ((((class color) (min-colors 89)) (:height 1.2))))
 '(linum ((((class color) (min-colors 89)) (:foreground "#a8a8bf" :background "#efeae9"))))
 '(markdown-header-face-1 ((((class color) (min-colors 89)) (:inherit bold :foreground "#3a81c3" :height 1.3 :background nil))))
 '(markdown-header-face-2 ((((class color) (min-colors 89)) (:inherit bold :foreground "#2d9574" :height 1.2 :background nil))))
 '(markdown-header-face-3 ((((class color) (min-colors 89)) (:bold nil :foreground "#67b11d" :height 1.1 :background nil))))
 '(markdown-header-face-4 ((((class color) (min-colors 89)) (:bold nil :foreground "#b1951d" :background nil))))
 '(markdown-header-face-5 ((((class color) (min-colors 89)) (:bold nil :foreground "#3a81c3"))))
 '(markdown-header-face-6 ((((class color) (min-colors 89)) (:bold nil :foreground "#2d9574"))))
 '(mode-line ((((class color) (min-colors 89)) (:foreground "#655370" :background "#e7e5eb" :box (:color "#b3b9be" :line-width 1)))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:inherit bold :foreground "#6c3163"))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef" :box (:color "#b3b9be" :line-width 1)))))
 '(org-agenda-clocking ((((class color) (min-colors 89)) (:background "#d3d3e7" :foreground "#6c4173"))))
 '(org-agenda-date ((((class color) (min-colors 89)) (:foreground "#715ab1" :height 1.1))))
 '(org-agenda-date-today ((((class color) (min-colors 89)) (:foreground "#3a81c3" :inherit bold :height 1.3))))
 '(org-agenda-date-weekend ((((class color) (min-colors 89)) (:inherit bold :foreground "#715ab1"))))
 '(org-agenda-done ((((class color) (min-colors 89)) (:foreground "#42ae2c" :height 1.2))))
 '(org-agenda-structure ((((class color) (min-colors 89)) (:inherit bold :foreground "#6c4173"))))
 '(org-block ((((class color) (min-colors 89)) (:background "#e8e3f0" :foreground "#655370"))))
 '(org-block-begin-line ((((class color) (min-colors 89)) (:background "#ddd8eb" :foreground "#9380b2"))))
 '(org-block-end-line ((((class color) (min-colors 89)) (:background "#ddd8eb" :foreground "#9380b2"))))
 '(org-clock-overlay ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(org-code ((((class color) (min-colors 89)) (:foreground "#21b8c7"))))
 '(org-column ((((class color) (min-colors 89)) (:background "#d3d3e7"))))
 '(org-column-title ((((class color) (min-colors 89)) (:background "#d3d3e7"))))
 '(org-date ((((class color) (min-colors 89)) (:underline t :foreground "#715ab1"))))
 '(org-date-selected ((((class color) (min-colors 89)) (:background "#6c3163" :foreground "#fbf8ef"))))
 '(org-document-info-keyword ((((class color) (min-colors 89)) (:foreground "#da8b55"))))
 '(org-document-title ((((class color) (min-colors 89)) (:foreground "#6c3163" :inherit bold :height 1.4 :underline t))))
 '(org-done ((((class color) (min-colors 89)) (:foreground "#42ae2c" :inherit bold :background "#edf2e9"))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(org-footnote ((((class color) (min-colors 89)) (:underline t :foreground "#655370"))))
 '(org-hide ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(org-level-1 ((((class color) (min-colors 89)) (:inherit bold :foreground "#3a81c3" :height 1.3 :background nil))))
 '(org-level-2 ((((class color) (min-colors 89)) (:inherit bold :foreground "#2d9574" :height 1.2 :background nil))))
 '(org-level-3 ((((class color) (min-colors 89)) (:bold nil :foreground "#67b11d" :height 1.1 :background nil))))
 '(org-level-4 ((((class color) (min-colors 89)) (:bold nil :foreground "#b1951d" :background nil))))
 '(org-level-5 ((((class color) (min-colors 89)) (:bold nil :foreground "#3a81c3"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:bold nil :foreground "#2d9574"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:bold nil :foreground "#67b11d"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:bold nil :foreground "#b1951d"))))
 '(org-link ((((class color) (min-colors 89)) (:underline t :foreground "#2aa1ae"))))
 '(org-meta-line ((((class color) (min-colors 89)) (:foreground "#da8b55"))))
 '(org-mode-line-clock-overrun ((((class color) (min-colors 89)) (:foreground "#e0211d"))))
 '(org-priority ((((class color) (min-colors 89)) (:foreground "#dc752f" :inherit bold))))
 '(org-quote ((((class color) (min-colors 89)) (:inherit org-block :slant italic))))
 '(org-scheduled ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(org-scheduled-today ((((class color) (min-colors 89)) (:foreground "#6c3163" :height 1.2))))
 '(org-sexp-date ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#6c3163"))))
 '(org-table ((((class color) (min-colors 89)) (:foreground "#655370" :background "#edf1ed"))))
 '(org-time-grid ((((class color) (min-colors 89)) (:foreground "#2d9574"))))
 '(org-todo ((((class color) (min-colors 89)) (:foreground "#dc752f" :inherit bold :background "#f6f1e1"))))
 '(org-verbatim ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(org-verse ((((class color) (min-colors 89)) (:inherit org-block :slant italic))))
 '(org-warning ((((class color) (min-colors 89)) (:foreground "#e0211d"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#dae6d0"))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:background "#eed9d2"))))
 '(sp-pair-overlay-face ((((class color) (min-colors 89)) (:background "#d3d3e7" :foreground nil))))
 '(sp-show-pair-match-face ((((class color) (min-colors 89)) (:foreground "#ba2f59" :inherit bold :underline t))))
 '(term ((((class color) (min-colors 89)) (:foreground "#655370" :background "#fbf8ef"))))
 '(term-color-black ((((class color) (min-colors 89)) (:foreground "#d2ceda"))))
 '(term-color-blue ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(term-color-cyan ((((class color) (min-colors 89)) (:foreground "#21b8c7"))))
 '(term-color-green ((((class color) (min-colors 89)) (:foreground "#67b11d"))))
 '(term-color-magenta ((((class color) (min-colors 89)) (:foreground "#a31db1"))))
 '(term-color-red ((((class color) (min-colors 89)) (:foreground "#f2241f"))))
 '(term-color-white ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(term-color-yellow ((((class color) (min-colors 89)) (:foreground "#b1951d"))))
 '(ffap ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(flx-highlight-face ((((class color) (min-colors 89)) (:foreground "#6c4173" :underline nil))))
 '(js2-external-variable ((((class color) (min-colors 89)) (:foreground "#6c4173"))))
 '(js2-function-param ((((class color) (min-colors 89)) (:foreground "#4e3163"))))
 '(js2-jsdoc-html-tag-delimiter ((((class color) (min-colors 89)) (:foreground "#2d9574"))))
 '(js2-jsdoc-html-tag-name ((((class color) (min-colors 89)) (:foreground "#3a81c3"))))
 '(js2-jsdoc-value ((t (:foreground "#2d9574"))))
 '(js2-private-function-call ((((class color) (min-colors 89)) (:foreground "#4e3163"))))
 '(js2-private-member ((((class color) (min-colors 89)) (:foreground "#655370"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) :foreground nil :background "#e0211d")))
 '(undo-tree-visualizer-current-face ((((class color) (min-colors 89)) :foreground "#3a81c3")))
 '(undo-tree-visualizer-default-face ((((class color) (min-colors 89)) :foreground "#655370")))
 '(undo-tree-visualizer-register-face ((((class color) (min-colors 89)) :foreground "#6c4173")))
 '(undo-tree-visualizer-unmodified-face ((((class color) (min-colors 89)) :foreground "#715ab1")))
 '(default ((((class color) (min-colors 89)) (:background "#fbf8ef" :foreground "#655370"))))
 '(helm-ls-git-modified-not-staged-face ((t (:foreground "#dc752f"))))
 '(helm-ls-git-added-modified-face ((t (:foreground "#3a81c3"))))
 '(helm-ls-git-deleted-and-staged-face ((t (:foreground "DimGray"))))
 '(helm-ls-git-conflict-face ((t (:foreground "MediumVioletRed"))))
 '(helm-ls-git-modified-and-staged-face ((t (:foreground "#dc752f"))))
 '(helm-ls-git-untracked-face ((t (:foreground "#ba2f59"))))
 '(helm-ls-git-added-copied-face ((t (:foreground "#2d9574"))))
 '(helm-ls-git-renamed-modified-face ((t (:foreground "#6c4173"))))
 '(helm-ls-git-deleted-not-staged-face ((t (:foreground "Darkgoldenrod3")))))

(provide-theme 'spacemacs-light-dylan)
