;; guide key config
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/guide-key-sequence '(("C-x p") ("M-r")))
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/idle-delay 0.1)
(setq ns-pop-up-frames nil)


;; my custom bindings!

;; a minor mode for all my "override" key bindings:
(defvar dcon-minor-mode-map (make-keymap) "dcon-minor-mode keymap.")
(define-minor-mode dcon-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " dcon" 'dcon-minor-mode-map)
(defun my-minibuffer-setup-hook ()
  (dcon-minor-mode 0))
;; turn this off in the minibuffer:
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
(dcon-minor-mode 1)

;; -----------------------------------------------------------------------------------------------------
;; helm bindings

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x a") 'helm-apropos)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-k") 'helm-project-search)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "M-K") 'my-helm-do-ag)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key dcon-minor-mode-map (kbd "C-x t") 'helm-imenu)

;; window management
(define-key dcon-minor-mode-map (kbd "M-o") 'win-switch-next-window)
(define-key dcon-minor-mode-map (kbd "M-O") 'win-switch-previous-window)

(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-x S-K") '(lambda () (interactive) (kill-current-buffer)(delete-window)))
(global-set-key (kbd "s-4") 'windows-swap)
(global-set-key (kbd "s-5") 'windows-flip)

;; utilities
(global-set-key (kbd "C-c h") 'describe-key)
(global-set-key (kbd "C-c z") 'copy-full-path-to-kill-ring)
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; general text editing
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(define-key dcon-minor-mode-map (kbd "C-M-h") 'kill-whole-line)
(define-key dcon-minor-mode-map (kbd "C-j") 'er/expand-region)

(global-set-key (kbd "C-q") 'backward-kill-word)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(define-key key-translation-map (kbd "C-q") (kbd "C-<backspace>"))
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key key-translation-map (kbd "C-c p") (kbd "<f2>"))

;; magit
(global-set-key (kbd "s-SPC") 'magit-status)

;; directory shortcuts
(global-set-key (kbd "C-,") 'dired-up)
(global-set-key (kbd "H-h") '(lambda () (interactive) (find-file "~/")))
(global-set-key (kbd "H-s") '(lambda () (interactive) (find-file "~/drive/sites/shortstack")))
(global-set-key (kbd "H-r") '(lambda () (interactive) (find-file "~/drive/sites/shortstack-server")))
(global-set-key (kbd "H-d") '(lambda () (interactive) (find-file "~/drive/sites/shortstack-designer")))
(global-set-key (kbd "H-a") '(lambda () (interactive) (find-file "~/drive/sites/shortstack-admin")))
(global-set-key (kbd "H-e") '(lambda () (interactive) (find-file "~/.emacs.d")))

(define-key dcon-minor-mode-map (kbd "M-/") 'point-undo)
(define-key dcon-minor-mode-map (kbd "M-.") 'point-redo)
(define-key dcon-minor-mode-map (kbd "C-x C-u") 'reopen-last-closed-buffer)
(define-key dcon-minor-mode-map (kbd "M-P") 'package-install)
(define-key dcon-minor-mode-map (kbd "C-M-P") 'package-list-packages)
(define-key dcon-minor-mode-map (kbd "M-C-p") 'helm-eshell-history)
(define-key dcon-minor-mode-map (kbd "C-c f") 'helm-dash)
(define-key dcon-minor-mode-map (kbd "C-x f") 'helm-recentf)
(define-key dcon-minor-mode-map (kbd "M-s s") 'scroll-bar-mode)
(define-key dcon-minor-mode-map (kbd "M-j") 'helm-resume)
(define-key dcon-minor-mode-map (kbd "C-x n") 'make-frame)

(global-set-key (kbd "C-S-n") 'org-move-subtree-down)
(global-set-key (kbd "C-S-p") 'org-move-subtree-up)
(global-set-key (kbd "C-c c") 'org-capture)
(define-key org-mode-map "\C-cp" 'org-mobile-pull)
(define-key org-agenda-mode-map "\C-cp" 'org-mobile-pull)


(define-key dcon-minor-mode-map (kbd "C-x C-n") 'flycheck-tip-cycle)
(define-key dcon-minor-mode-map (kbd "C-x C-p") 'flycheck-tip-cycle-reverse)

;; (define-key dcon-minor-mode-map (kbd "s-N") 'move-text-down)
;; (define-key dcon-minor-mode-map (kbd "s-P") 'move-text-up)

(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;; (add-hook 'haml-mode-hook
;;           '(lambda () (define-key haml-mode-map "\M-'" 'haml-comment-dwim)))

(add-hook 'web-mode-hook
	  '(lambda () (define-key web-mode-map (kbd "C-M-f") 'web-mode-element-end))
	  '(lambda () (define-key web-mode-map (kbd "M-'") 'web-mode-comment-or-uncomment))
	  )

(add-hook 'web-mode-hook
	  '(lambda () (define-key web-mode-map (kbd "C-M-b")
			'(lambda () (interactive)
			   (backward-char 1)
			   (web-mode-element-beginning)))))

(define-key dcon-minor-mode-map (kbd "M-i") 'helm-swoop)
(define-key dcon-minor-mode-map (kbd "M-I") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(define-key dcon-minor-mode-map (kbd "s-n") 'mc/mark-next-like-this)
(define-key dcon-minor-mode-map (kbd "s-N") 'mc/unmark-next-like-this)
(define-key dcon-minor-mode-map (kbd "s-p") 'mc/mark-previous-like-this)
(define-key dcon-minor-mode-map (kbd "s-P") 'mc/unmark-previous-like-this)

(define-key dcon-minor-mode-map (kbd "s-1") 'delete-other-windows)
(define-key dcon-minor-mode-map (kbd "s-2") 'split-window-below-and-move-there-dammit)
(define-key dcon-minor-mode-map (kbd "C-x 2") 'split-window-below-and-move-there-dammit)
(define-key dcon-minor-mode-map (kbd "s-3") 'split-window-right-and-move-there-dammit)
(define-key dcon-minor-mode-map (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

(define-key dcon-minor-mode-map (kbd "C-c a") 'org-agenda)
;; (define-key dcon-minor-mode-map (kbd "C-}") 'enlarge-window-horizontally)
;; (define-key dcon-minor-mode-map (kbd "C-{") 'shrink-window-horizontally)
(define-key dcon-minor-mode-map (kbd "C-S-L") 'enlarge-window-horizontally)
(define-key dcon-minor-mode-map (kbd "C-S-H") 'shrink-window-horizontally)
(define-key dcon-minor-mode-map (kbd "C-S-K") 'enlarge-window)
(define-key dcon-minor-mode-map (kbd "C-S-J") 'shrink-window)

(key-chord-define-global "fj" 'ace-jump-word-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode-pop-mark)

(global-set-key (kbd "C-x C-o") 'open-dir-in-finder)

(global-set-key (kbd "M-e") 'web-mode-fold-or-unfold)


(global-set-key (kbd "C-x y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-b") 'helm-bookmarks)
(key-chord-define-global "wj" 'calculator)
;; (key-chord-define-global "l " "=")
;; (key-chord-define-global "o " "_")
;; (key-chord-define-global "i " "-")

(key-chord-define-global "ww" 'text-scale-increase)
(key-chord-define-global "qq" 'text-scale-decrease)
(key-chord-define-global "aa" '(lambda () (interactive) (text-scale-set 0)))

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

(global-set-key (kbd "C-c n") 'cleanup-buffer)

(define-key dcon-minor-mode-map (kbd "C-x g") 'browse-file-on-github)

(global-set-key (kbd "C-/") 'undo-tree-undo)
(global-set-key (kbd "C-.") 'undo-tree-redo)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)
(global-set-key (kbd "C-c o") 'other-frame)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "C-x C-v") 'global-visual-line-mode)

(global-set-key (kbd "C-x C-t") '(lambda () "DOCSTRING" (interactive) (start-eshell-in-split-window)))

(global-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-<left>" ) 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-S-<left>") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-S-<right>") 'sp-backward-barf-sexp)
(global-set-key (kbd "M-<delete>") 'sp-unwrap-sexp)

;; git-gutter
(define-key dcon-minor-mode-map (kbd "M-r n") 'git-gutter+-next-hunk)
(define-key dcon-minor-mode-map (kbd "M-r p") 'git-gutter+-previous-hunk)
(define-key dcon-minor-mode-map (kbd "M-r d") 'git-gutter+-popup-hunk)
(define-key dcon-minor-mode-map (kbd "M-r r") 'git-gutter+-revert-hunk)

;; auto-complete settings
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;; guide key
(define-key dcon-minor-mode-map (kbd "C-x p d") 'projectile-find-dir)
(define-key dcon-minor-mode-map (kbd "C-x p i") 'projectile-invalidate-cache)
(define-key dcon-minor-mode-map (kbd "C-x p l") 'package-list-packages)
(define-key dcon-minor-mode-map (kbd "C-x p p") 'projectile-purge-file-from-cache)
(define-key dcon-minor-mode-map (kbd "C-o") 'open-line-above)
(define-key dcon-minor-mode-map (kbd "M-T") 'my-tail)
(define-key dcon-minor-mode-map (kbd "C-c m") 'view-echo-area-messages)

;; evil mode stuff

;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;; (define-key evil-visual-state-map (kbd "C-e") 'evil-end-of-line)
;; (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
;; (define-key evil-insert-state-map (kbd "C-d") 'delete-forward-char)

;;(define-key evil-insert-state-map (kbd "C-l") 'delete-forward-char)
;; (define-key evil-insert-state-map (kbd "C-j") 'delete-forward-char)

(global-set-key (kbd "s-/") 'winner-undo)
(global-set-key (kbd "s-.") 'winner-redo)

(provide 'bindings-setup)
