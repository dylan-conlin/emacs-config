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


(defhydra helm-like-unite (:hint nil
                                 :color pink)
  "
Nav ^^^^^^^^^        Mark ^^          Other ^^       Quit
^^^^^^^^^^------------^^----------------^^----------------------
_K_ ^ ^ _k_ ^ ^     _m_ark           _v_iew         _i_: cancel
^↕^ _h_ ^✜^ _l_     _t_oggle mark    _H_elp         _o_: quit
_J_ ^ ^ _j_ ^ ^     _U_nmark all     _d_elete
^^^^^^^^^^                           _f_ollow: %(helm-attr 'follow)
"
  ;; arrows
  ("h" helm-beginning-of-buffer)
  ("j" helm-next-line)
  ("k" helm-previous-line)
  ("l" helm-end-of-buffer)
  ;; beginning/end
  ("g" helm-beginning-of-buffer)
  ("G" helm-end-of-buffer)
  ;; scroll
  ("K" helm-scroll-other-window-down)
  ("J" helm-scroll-other-window)
  ;; mark
  ("m" helm-toggle-visible-mark)
  ("t" helm-toggle-all-marks)
  ("U" helm-unmark-all)
  ;; exit
  ("<escape>" keyboard-escape-quit "" :exit t)
  ("o" keyboard-escape-quit :exit t)
  ("i" nil)
  ;; sources
  ("}" helm-next-source)
  ("{" helm-previous-source)
  ;; rest
  ("H" helm-help)
  ("v" helm-execute-persistent-action)
  ("d" helm-persistent-delete-marked)
  ("f" helm-follow-mode))

(define-key helm-map (kbd "<escape>") 'helm-like-unite/body)

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
     (set-cursor-color "blue"))
   :timeout 1.5)
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

(defhydra hydra-selection ()
  "actions on regions of text"
  ("a" align-entire     "Align")
  ("u" upcase-region    "Upcase")
  ("d" downcase-region  "Downcase")
  ("s" sort-lines       "Sort Lines")
  ("f" fill-region      "Fill Region")
  ("r" reverse-region   "Reverse")
  ("F" unfill-region    "Unfill Region")
  ("q" nil))

(bind-key "C-x U" 'hydra-selection/body)


;; Hydra - Marking
(defhydra hydra-mark (:exit t
                            :columns 3
                            :idle 1.0)
  "Mark"
  ("d" er/mark-defun "Defun / Function")
  ("f" er/mark-defun "Defun / Function")
  ("F" er/mark-clj-function-literal "Clj anonymous fn")
  ("w" er/mark-word "Word")
  ("W" er/mark-clj-word "CLJ word")
  ("u" er/mark-url "Url")
  ("e" mark-sexp "S-Expression")
  ("E" er/mark-email "Email")
  ("b" hydra-mark-buffer/body "Buffer")
  ("l" mark-line "Line")
  ("p" er/mark-text-paragraph "Paragraph")
  ("r" er/mark-clj-regexp-literal "Clj regexp")
  ("s" er/mark-symbol "Symbol")
  ("S" er/mark-symbol-with-prefix "Prefixed symbol")
  ("q" er/mark-inside-quotes "Inside quotes")
  ("Q" er/mark-outside-quotes "Outside quotes")
  ("(" er/mark-inside-pairs "Inside pairs")
  ("[" er/mark-inside-pairs "Inside pairs")
  ("{" er/mark-inside-pairs "Inside pairs")
  (")" er/mark-outside-pairs "Outside pairs")
  ("]" er/mark-outside-pairs "Outside pairs")
  ("}" er/mark-outside-pairs "Outside pairs")
  ("t" er/mark-inner-tag "Inner tag")
  ("T" er/mark-outer-tag "Outer tag")
  ("c" er/mark-comment "Comment")
  ("a" er/mark-html-attribute "HTML attribute")
  ("." er/expand-region "Expand region" :exit nil)
  ("," er/contract-region "Contract region" :exit nil)
  ("#" er/mark-clj-set-literal "Clj set")
  )

(defhydra hydra-bmk (:exit t :columns 2)
  ("s" (find-file "~/Dropbox/ss_vagrant/shortstack_apps/shortstack") "shortstack")
  ("r" (find-file "~/Dropbox/ss_vagrant/shortstack_apps/shortstack-server") "server")
  ("d" (find-file "~/Dropbox/ss_vagrant/shortstack_apps/shortstack-designer") "designer")
  ("a" (find-file "~/Dropbox/ss_vagrant/shortstack_apps/shortstack-api") "api")
  ("y" (find-file "~/Dropbox/ss_vagrant/shortstack_apps/shortstack-style") "style")
  ("o" (find-file "~/Dropbox/org") "org")
  ("w" (find-file "~/Dropbox/org/todo-work.org") "todo-work.org")
  ("h" (find-file "~/") "home")
  ("b" (find-file "~/Dropbox/org/todo-build.org") "todo-build.org")
  ("p" (find-file "~/Dropbox/org/todo-personal.org") "todo-personal.org")
  ("e" (find-file "~/.emacs.d/") ".emacs.d")
  ("i" (find-file "~/Dropbox/side-sites/ruby-projects/work-projects/instant-win-app/") "instant-win-app")
  ("z" (find-file "~/Dropbox/side-sites/") "side-sites")
  )

(provide 'hydras)
