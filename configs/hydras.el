(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

;;* Helpers
(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defhydra my-hydra-last-change ()
  "goto-last-change"
  ("p" goto-last-change "previous")
  ("n" goto-last-change-reverse "next"))

(defhydra my-hydra-dired (:hint nil)
  ("p" dired-previous-line)
  ("n" dired-next-line)
  ("<enter>" dired-find-file)
  ("o" dired-find-file-other-window "open in other window")
  ("^" dired-up "up")
  
  ("m" dired-mark "mark")
  ("u" dired-unmark "unmark")
  ("U" dired-unmark-all-marks "unmark-all")
  
  ;; ("%-m" dired-mark-files-regexp "mark-by-regexp")
  ("+" dired-create-directory "create dir")
  ("D" dired-do-delete "delete")
  ("C" dired-do-copy "copy")
  ("R" dired-do-rename "rename")
  ("S" dired-do-symlink "symlink")
  ("g" revert-buffer "refresh")
  ("!" dired-do-shell-command "shell-command")
  ("q" nil))


(defhydra my-hydra-org (:color red :hint nil)
  "
Navigation^
---------------------------------------------------------
_j_ next heading
_k_ prev heading
_h_ next heading (same level)
_l_ prev heading (same level)
_u_p higher heading
_g_o to
"
  ("j" outline-next-visible-heading)
  ("k" outline-previous-visible-heading)
  ("h" org-forward-heading-same-level)
  ("l" org-backward-heading-same-level)
  ("u" outline-up-heading)
  ("g" org-goto :exit t))


(defhydra my-hydra-helm (:hint nil :color pink)
  "
                                                                          ╭──────┐
   Navigation   Other  Sources     Mark             Do             Help   │ Helm │
  ╭───────────────────────────────────────────────────────────────────────┴──────╯
        ^_k_^         _K_       _p_   [_m_] mark         [_v_] view         [_H_] helm help
        ^^↑^^         ^↑^       ^↑^   [_t_] toggle all   [_d_] delete       [_s_] source help
    _h_ ←   → _l_     _c_       ^ ^   [_u_] unmark all   [_f_] follow: %(helm-attr 'follow)
        ^^↓^^         ^↓^       ^↓^    ^ ^               [_y_] yank selection
        ^_j_^         _J_       _n_    ^ ^               [_w_] toggle windows
  --------------------------------------------------------------------------------
        "
  ("<tab>" helm-keyboard-quit "back" :exit t)
  ("<escape>" nil "quit")
  ("\\" (insert "\\") "\\" :color blue)
  ("h" helm-beginning-of-buffer)
  ("j" helm-next-line)
  ("k" helm-previous-line)
  ("l" helm-end-of-buffer)
  ("g" helm-beginning-of-buffer)
  ("G" helm-end-of-buffer)
  ("n" helm-next-source)
  ("p" helm-previous-source)
  ("K" helm-scroll-other-window-down)
  ("J" helm-scroll-other-window)
  ("c" helm-recenter-top-bottom-other-window)
  ("m" helm-toggle-visible-mark)
  ("t" helm-toggle-all-marks)
  ("u" helm-unmark-all)
  ("H" helm-help)
  ("s" helm-buffer-help)
  ("v" helm-execute-persistent-action)
  ("d" helm-persistent-delete-marked)
  ("y" helm-yank-selection)
  ("w" helm-toggle-resplit-and-swap-windows)
  ("f" helm-follow-mode))

(key-chord-define helm-map "jk" 'my-hydra-helm/body)


(defhydra my-hydra-git-gutter (:body-pre (git-gutter-mode 1)
                                         :hint nil)
  "
Git gutter:
  _j_: next hunk        _s_tage hunk     _q_uit
  _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   _p_opup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("h" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("l" (progn (goto-char (point-min))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("p" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision)
  ("q" nil :color blue)
  ("Q" (progn (git-gutter-mode -1)
              ;; git-gutter-fringe doesn't seem to
              ;; clear the markup right away
              (sit-for 0.1)
              (git-gutter:clear))
   :color blue))



;; (defhydra hydra-macro (:hint nil :color pink :pre 
;;                              (when defining-kbd-macro
;;                                  (kmacro-end-macro 1)))
;;   "
;;   ^Create-Cycle^   ^Basic^           ^Insert^        ^Save^         ^Edit^
;; ╭─────────────────────────────────────────────────────────────────────────╯
;;      ^_i_^           [_e_] execute    [_n_] insert    [_b_] name      [_'_] previous
;;      ^^↑^^           [_d_] delete     [_t_] set       [_K_] key       [_,_] last
;;  _j_ ←   → _l_       [_o_] edit       [_a_] add       [_x_] register     
;;      ^^↓^^           [_r_] region     [_f_] format    [_B_] defun
;;      ^_k_^           [_m_] step
;;     ^^   ^^          [_s_] swap
;; "
;;   ("j" kmacro-start-macro :color blue)
;;   ("l" kmacro-end-or-call-macro-repeat)
;;   ("i" kmacro-cycle-ring-previous)
;;   ("k" kmacro-cycle-ring-next)
;;   ("r" apply-macro-to-region-lines)
;;   ("d" kmacro-delete-ring-head)
;;   ("e" kmacro-end-or-call-macro-repeat)
;;   ("o" kmacro-edit-macro-repeat)
;;   ("m" kmacro-step-edit-macro)
;;   ("s" kmacro-swap-ring)
;;   ("n" kmacro-insert-counter)
;;   ("t" kmacro-set-counter)
;;   ("a" kmacro-add-counter)
;;   ("f" kmacro-set-format)
;;   ("b" kmacro-name-last-macro)
;;   ("K" kmacro-bind-to-key)
;;   ("B" insert-kbd-macro)
;;   ("x" kmacro-to-register)
;;   ("'" kmacro-edit-macro)
;;   ("," edit-kbd-macro)
;;   ("q" nil :color blue))

;; (bind-key "C-x (" 'hydra-macro/body)


;;** Example 2: move window splitter

(defun prepare-cursor (color type blinkp)
  (set-cursor-color color)
  (setq cursor-type type)
  (blink-cursor-mode blinkp))

(setq blink-cursor-delay 0)
(setq blink-cursor-interval 0.1)

(defhydra my-hydra-window 
  (:pre 
   (progn 
     (setq hydra-is-helpful nil)
     (set-cursor-color "red"))
   :post
   (progn 
     (setq hydra-is-helpful t)
     (set-cursor-color "blue")))
  ("h" windmove-left "←")
  ("j" windmove-down "↓")
  ("k" windmove-up "↑")
  ("l" windmove-right "→")
  ("H" hydra-move-splitter-left "splitter-left")
  ("J" hydra-move-splitter-down "splitter-down")
  ("K" hydra-move-splitter-up "splitter-up")
  ("L" hydra-move-splitter-right "splitter-right")
  ("0" ace-delete-window "ace-delete")
  ("d" delete-window "delete this window")
  ("v" my/hsplit-last-buffer "v-split")
  ("x" my/vsplit-last-buffer "h-split")
  ("o" delete-other-windows "delete-others")
  ("s" ace-swap-window "swap")
  ("f" windows-flip "flip")
  ("u" winner-undo "undo")
  ("r" winner-redo "redo"))

(bind-key "M-o" 'my-hydra-window/body)

(defhydra my-hydra-flycheck
  (:pre (progn (setq hydra-lv t) (flycheck-list-errors))
        :post (progn (setq hydra-lv nil) (quit-windows-on "*Flycheck errors*"))
        :hint nil)
  "Errors"
  ("f"  flycheck-error-list-set-filter                            "Filter")
  ("j"  flycheck-next-error                                       "Next")
  ("k"  flycheck-previous-error                                   "Previous")
  ("gg" flycheck-first-error                                      "First")
  ("G"  (progn (goto-char (point-max)) (flycheck-previous-error)) "Last")
  ("c" flycheck-copy-errors-as-kill "Copy Error")
  ("q"  nil))

(bind-key "C-x r f" 'my-hydra-flycheck/body)

(defhydra dh-hydra-markdown-mode (:hint nil)
  "
Formatting        C-c C-s    _s_: bold          _e_: italic     _b_: blockquote   _p_: pre-formatted    _c_: code

Headings          C-c C-t    _h_: automatic     _1_: h1         _2_: h2           _3_: h3               _4_: h4

Lists             C-c C-x    _m_: insert item   

Demote/Promote    C-c C-x    _l_: promote       _r_: demote     _u_: move up      _d_: move down

Links, footnotes  C-c C-a    _L_: link          _U_: uri        _F_: footnote     _W_: wiki-link      _R_: reference

"


  ("s" markdown-insert-bold)
  ("e" markdown-insert-italic)
  ("b" markdown-insert-blockquote :color blue)
  ("p" markdown-insert-pre :color blue)
  ("c" markdown-insert-code)

  ("h" markdown-insert-header-dwim) 
  ("1" markdown-insert-header-atx-1)
  ("2" markdown-insert-header-atx-2)
  ("3" markdown-insert-header-atx-3)
  ("4" markdown-insert-header-atx-4)

  ("m" markdown-insert-list-item)

  ("l" markdown-promote)
  ("r" markdown-demote)
  ("d" markdown-move-down)
  ("u" markdown-move-up)  

  ("L" markdown-insert-link :color blue)
  ("U" markdown-insert-uri :color blue)
  ("F" markdown-insert-footnote :color blue)
  ("W" markdown-insert-wiki-link :color blue)
  ("R" markdown-insert-reference-link-dwim :color blue) 
  )


(global-set-key [f9] 'dh-hydra-markdown-mode/body)


(defun my--set-transparency (inc)
  "Increase or decrease the selected frame transparency"
  (let* ((alpha (frame-parameter (selected-frame) 'alpha))
         (next-alpha (cond ((not alpha) 100)
                           ((> (- alpha inc) 100) 100)
                           ((< (- alpha inc) 0) 0)
                           (t (- alpha inc)))))
    (set-frame-parameter (selected-frame) 'alpha next-alpha)))

(defhydra hydra-transparency (:columns 2)
  "
ALPHA : [ %(frame-parameter nil 'alpha) ]
"
  ("j" (lambda () (interactive) (my--set-transparency +1)) "+ more")
  ("k" (lambda () (interactive) (my--set-transparency -1)) "- less")
  ("J" (lambda () (interactive) (my--set-transparency +10)) "++ more")
  ("K" (lambda () (interactive) (my--set-transparency -10)) "-- less")
  ("=" (lambda (value) (interactive "nTransparency Value 0 - 100 opaque:")
         (set-frame-parameter (selected-frame) 'alpha value)) "Set to ?" :color blue))

(defhydra cqql-multiple-cursors-hydra (:hint nil)
  "
     ^Up^            ^Down^        ^Miscellaneous^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("q" nil))

;; (defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
;;                                      :color pink
;;                                      :hint nil
;;                                      :post (deactivate-mark))
;;   "
;;   ^_k_^       _w_ copy      _o_pen       _N_umber-lines            |\\     -,,,--,,_
;; _h_   _l_     _y_ank        _t_ype       _e_xchange-point          /,`.-'`'   ..  \-;;,_
;;   ^_j_^       _d_ kill      _c_lear      _r_eset-region-mark      |,4-  ) )_   .;.(  `'-'
;; ^^^^          _u_ndo        _g_ quit     ^ ^                     '---''(./..)-'(_\_)
;; "
;;   ("k" rectangle-previous-line)
;;   ("j" rectangle-next-line)
;;   ("h" rectangle-backward-char)
;;   ("l" rectangle-forward-char)
;;   ("d" kill-rectangle)                    ;; C-x r k
;;   ("y" yank-rectangle)                    ;; C-x r y
;;   ("w" copy-rectangle-as-kill)            ;; C-x r M-w
;;   ("o" open-rectangle)                    ;; C-x r o
;;   ("t" string-rectangle)                  ;; C-x r t
;;   ("c" clear-rectangle)                   ;; C-x r c
;;   ("e" rectangle-exchange-point-and-mark) ;; C-x C-x
;;   ("N" rectangle-number-lines)            ;; C-x r N
;;   ("r" (if (region-active-p)
;;            (deactivate-mark)
;;          (rectangle-mark-mode 1)))
;;   ("u" undo nil)
;;   ("g" nil))
;; (global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)

(defhydra hydra-fold (:pre (hs-minor-mode 1))
  "fold"
  ("t" fold-dwim-toggle "toggle")
  ("h" fold-dwim-hide-all "hide-all")
  ("s" fold-dwim-show-all "show-all")
  ("q" nil "quit"))

(global-set-key (kbd "C-x SPC") 'avy-pop-mark)
(global-set-key (kbd "s-f") 'hydra-fold/body)

(provide 'hydras)
