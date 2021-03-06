;; (setq ns-pop-up-frames nil)
;; my custom bindings!

;; a minor mode for all my "override" key bindings:
(defvar dcon-minor-mode-map (make-keymap) "dcon-minor-mode keymap.")
(define-minor-mode dcon-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " dcon" 'dcon-minor-mode-map)
(diminish 'dcon-minor-mode)
(defun my-minibuffer-setup-hook ()
  (dcon-minor-mode 0))
;; turn this off in the minibuffer:
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
(dcon-minor-mode 1)

(bind-key "s-q" nil)
(bind-key "C-k" 'kill-line)
(bind-key "s-o" 'open-line-below)
(bind-key "C-s" 'isearch-forward-regexp)
(bind-key "C-r" 'isearch-backward-regexp)
(bind-key* "C-c SPC" 'rectangle-mark-mode)


;; window management
(bind-key "C-x 2" '(lambda () (interactive) (message "try s-w")))
(bind-key "C-x 3" '(lambda () (interactive) (message "try s-w")))


(bind-key "M-i" 'helm-swoop-without-pre-input)
(bind-key "s-s" 'ispell-word)
(bind-key "s-w" 'delete-window)
(bind-key "M-0" 'delete-window)
(bind-key "C-x o" 'other-window)
(bind-key "C-x k" 'kill-current-buffer)
(bind-key "C-x S-K" '(lambda () (interactive) (kill-current-buffer)(delete-window)))
(bind-key "C-x r l" 'ruby-logger)
(bind-key "C-x r t" 'ruby-toggle-active-test)
(bind-key "C-x r T" 'ruby-deactivate-all-tests)
(bind-key "C-x j l" 'js-logger)
;; utilities
(bind-key "C-c h" 'describe-key)

(bind-key "C-c y" 'copy-full-path-to-kill-ring)
(bind-key "C-c Y" 'copy-current-git-file-path)
(bind-key "C-x c r" 'rspec-test-at-current-line-number)
(bind-key "C-x c m" 'minitest-test-at-current-line-number)
(bind-key "C-c C-k" 'eval-buffer)

;; general text editing
;; dcon-minor-mode
;; (define-key dcon-minor-mode-map (kbd "C-h") 'backward-delete-char-untabify)

(bind-key "DEL" 'backward-delete-char-untabify)


(bind-key "C-q" 'backward-kill-word)

;; (bind-key* "M-p" 'backward-paragraph)
;; (bind-key* "M-n" 'forward-paragraph)
;; (define-key key-translation-map (kbd "C-q") (kbd "C-<backspace>"))
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))


;; magit
(bind-key "s-SPC" 'magit-status)
(bind-key "s-b" 'magit-branch-manager)

;; directory shortcuts
(bind-key "C-," 'dired-up)

(defhydra dired-sorter (global-map "<f2>")
  "dired sorter"
  ("c" dired-sort-ctime "created")
  ("u" dired-sort-utime "updated"))

(defhydra hydra-dired-buffer-menu (:color blue :hint nil)
  "
^Sort^
^^^^^^^^-------------------------------------------
_c_: created
_u_: updated
_q_: cancel
  "
  ("c" dired-sort-ctime)
  ("u" dired-sort-utime)
  ("q" nil :color red)
  )

(bind-key "s-<up>" 'org-move-subtree-up)
(bind-key "s-<down>" 'org-move-subtree-down)

(bind-key "C-x p l" 'paradox-list-packages)


(bind-key "C-x C-u" 'reopen-last-closed-buffer)
(bind-key "M-s s" 'scroll-bar-mode)
;; (bind-key "C-x n" 'make-frame)

;; (bind-key "C-x C-n" 'flycheck-tip-cycle)
;; (bind-key "C-x C-p" 'flycheck-tip-cycle-reverse)

(bind-key "M-;" 'evilnc-comment-or-uncomment-lines)

;; (bind-key "M-;" 'comment-dwim-2)

(key-chord-define-global "fj" 'avy-goto-char-timer)
(key-chord-define-global "hf" 'avy-goto-char-timer)
(key-chord-define-global "kh" 'avy-goto-char-in-line)
;; (key-chord-define-global "jk" 'goto-last-change)
;; (key-chord-define-global "fk" 'avy-goto-word-0)

(bind-key "C-x SPC" 'avy-pop-mark)
(bind-key "M-g g" 'avy-goto-line)

(bind-key "C-c SPC" 'rectangle-mark-mode)



(bind-key "C-x C-o" 'open-dir-in-finder)
(bind-key "M-z" 'capitalize-word-toggle)
(bind-key "M-e" 'zop-to-char)

(key-chord-define-global "fw" 'ruby-test-run)
(key-chord-define-global "gw" 'ruby-test-run-at-point)

(key-chord-define-global "JJ" 'hydra-bmk/body)

(key-chord-define-global "HH" 'previous-buffer)
(key-chord-define-global "LL" 'next-buffer)

(key-chord-define-global "wj" 'calculator)

(key-chord-define-global "mw" 'wrappy)
(key-chord-define-global "bw" 'unwrap-item)

(bind-key "C-x r q" 'save-buffers-kill-terminal)

(bind-key "C-x C-c" 'delete-frame)

;; Create scratch buffer
(bind-key "C-c b" 'create-scratch-buffer)

(bind-key "C-c w r" 'whitespace-cleanup-region)
(bind-key "C-c w b" 'cleanup-buffer)

(bind-key "C-x g" 'browse-at-remote)
(bind-key "C-x G" 'browse-at-remote/to-clipboard)


(bind-key "C-/" 'undo)


(bind-key "M-`" 'other-frame)
(bind-key "C-x C-v" 'global-visual-line-mode)

(bind-key "C-x C-t" 'open-in-iterm)

(bind-key "C-<right>" 'sp-forward-slurp-sexp)
(bind-key "C-<left>" 'sp-backward-slurp-sexp)
(bind-key "C-S-<left>" 'sp-forward-barf-sexp)
(bind-key "C-S-<right>" 'sp-backward-barf-sexp)
(bind-key "M-<delete>" 'sp-unwrap-sexp)


;; auto-complete settings
;; (bind-key "C-n" 'ac-next ac-menu-map)
;; (bind-key "C-p" 'ac-previous ac-menu-map)
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" nil)

;; ;; guide key
;; (bind-key "C-x p h" 'hue-lights-toggle)
;; (bind-key "C-x p c" 'customize)
;; (bind-key "C-x p f" 'customize-face)
;; (bind-key "C-x p d" 'projectile-find-dir)
;; (bind-key "C-x p i" 'projectile-invalidate-cache)
;; (bind-key "C-x p l" 'paradox-list-packages)

(bind-key "C-o" 'open-line-above)


(bind-key "s-=" (lambda () (interactive) (shell-command "hue lights all +25")))
(bind-key "s--" (lambda () (interactive) (shell-command "hue lights all -25")))

(bind-key "s-0" (lambda () (interactive) (text-scale-set 0)))

;; ;; esc quits
;; (defun minibuffer-keyboard-quit ()
;;   "Abort recursive edit.
;; In Dbind-key "s-1" 'delete-other-windows)
;; delete Selection mode, if the mark is active, just deactivate it;
;; then it takes a second \\[keyboard-quit] to abort the minibuffer."
;;   (interactive)
;;   (if (and delete-selection-mode transient-mark-mode mark-active)
;;       (setq deactivate-mark  t)
;;     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;;     (abort-recursive-edit)))

(bind-key "RET" 'new-line-dwim)

;; emms
(bind-key "C-x p a" 'emms-add-dired)
(bind-key "C-x w c" 'to-coffee)
(bind-key "C-x w j" 'to-javascript)


;; If you have lots of keybindings set in your .emacs file, it can be hard to know which
;; ones you haven't set yet -- and which may now be overriding some new default in
;; a new Emacs version. This module aims to solve that problem.

(bind-key "C-x p w" 'ispell)

(bind-key "C-w" 'kill-region)

;; If you want the keybinding to override all minor modes that may also bind the same key, use the bind-key* form:
;; (bind-key* "<C-return>" 'other-window)

;; If you want to rebind a key only for a particular mode, use:
(bind-key* "C-," 'dired-up)

;; To unbind a key within a keymap (for example, to stop your favorite major mode from
;; changing a binding that you don't want to override everywhere), use unbind-key:

;; (unbind-key "C-c x" some-other-mode-map)

;; After Emacs loads, you can see a summary of all your personal keybindings currently in effect with this command:
;; M-x describe-personal-keybindings
;; It will tell you if you've overriden a default keybinding, and what that default was.
;; Also, it will tell you if the key was rebound after your binding it with bind-key, and what it was rebound it to.

(key-chord-define-global "jl" 'c-hungry-delete-forward)

(define-key dcon-minor-mode-map (kbd "C-j") 'er/expand-region)
(define-key dcon-minor-mode-map (kbd "C-M-h") 'kill-whole-line)
(define-key dcon-minor-mode-map (kbd "s-q") 'camel-snake-toggle-word-at-point)

;; (define-key dcon-minor-mode-map (kbd "C-c C-s") '(lambda ()
;;                                                    (interactive)
;;                                                    (helm-do-ag "~/Dropbox/org/")))



;; ;; esc quits
;; (defun minibuffer-keyboard-quit ()
;;   "Abort recursive edit.
;;    In Delete Selection mode, if the mark is active, just deactivate it;
;;    then it takes a second \\[keyboard-quit] to abort the minibuffer."
;;   (interactive)
;;   (if (and delete-selection-mode transient-mark-mode mark-active)
;;       (setq deactivate-mark  t)
;;     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;;     (abort-recursive-edit)))
;; (this)

;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)

;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; (global-set-key [escape] 'evil-exit-emacs-state)

(global-set-key (kbd "M-9") 'corral-parentheses-backward)
(global-set-key (kbd "M-0") 'corral-parentheses-forward)
(global-set-key (kbd "M-[") 'corral-brackets-backward)
(global-set-key (kbd "M-]") 'corral-brackets-forward)
(global-set-key (kbd "M-{") 'corral-braces-backward)
(global-set-key (kbd "M-}") 'corral-braces-forward)
(global-set-key (kbd "M-\"") 'corral-double-quotes-backward)

(bind-key "s-c" 'evil-surround-change)
(bind-key "s-d" 'evil-surround-delete)

(bind-key "C-x n" 'flycheck-tip-cycle)

(bind-key "s-r" 'go-to-git-root)

(bind-key "M-n" 'forward-paragraph)
(bind-key "M-p" 'backward-paragraph)

(bind-key "C-x G" 'view-on-github)
(bind-key "C-x O" 'view-original-on-github)

;; (unbind-key "s-c")
(unbind-key "s-1")
(unbind-key "s-2")

(key-chord-define-global "KK" 'helm-org-rifle-org-directory)

(provide 'bindings-setup)
