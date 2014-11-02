;; customize eshell look and feel

(require 'em-smart)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(require 'shell-pop)

(require 'ansi-color)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))


(setq eshell-hist-ignoredups t)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(add-hook 'eshell-mode-hook
          '(lambda ()
             (rvm-activate-corresponding-ruby)))

(add-hook 'eshell-preoutput-filter-functions
          'ansi-color-apply)

(require 'esh-help)
(setup-esh-help-eldoc)


(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
                                        ;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
    (setq eshell-ask-to-save-history 'always)) ; For older(?) version
                                        ;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))

;; ;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat "["
                          (if (> (length git-output) 0)
                              (substring git-output 0 -1)
                            "(no branch)")
                          "]") 'face `(:foreground "orange"))
      )))

(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda (p-lst)
                        (if (> (length p-lst) 3)
                            (concat
                             (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                                        (substring elm 0 1)))
                                        (butlast p-lst 3)
                                        "/")
                             "/"
                             (mapconcat (lambda (elm) elm)
                                        (last p-lst 3)
                                        "/"))
                          (mapconcat (lambda (elm) elm)
                                     p-lst
                                     "/")))
                      (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "purple"))
         (or (curr-dir-git-branch-string (eshell/pwd)))
         (propertize "$ " 'face 'default))))

(setq eshell-highlight-prompt nil)


;; start new eshells respecting rvm

(defun set-ruby-version (ruby-version gemset-name)
  "set ruby version and start eshell"
  (interactive)
  (eshell)
  (rvm-use ruby-version gemset-name))

(defun project? (my-fn)
  "get the correct ruby depending on the current environment (dir/file)"
  (interactive)
  (cond
   ((s-contains? "global" (funcall my-fn))
    (message "global"))
   ((s-contains? "server" (funcall my-fn))
    (message "server"))
   ((s-contains? "designer" (funcall my-fn))
    (message "designer"))
   (t (message "shortstack"))))


(defun start-eshell ()
  "start eshell with the correct ruby version"
  (interactive)
  (cond
   ((equal (project? 'rvm-activate-corresponding-ruby) "global")
    (set-ruby-version "ruby-2.1.0p0" "global")
    (rename-buffer "$GLOBAL"))
   ((equal (project? 'rvm-activate-corresponding-ruby) "server")
    (set-ruby-version "ruby-1.9.2-p290" "shortstack-server")
    (rename-buffer "$SERVER"))
   ((equal (project? 'rvm-activate-corresponding-ruby) "shortstack")
    (set-ruby-version "ruby-1.9.2-p290" "shortstack-bundler")
    (rename-buffer "$SHORTSTACK"))
   ((equal (project? 'rvm-activate-corresponding-ruby) "designer")
    (set-ruby-version "ruby-1.9.3-p429" "shortstack-designer")
    (rename-buffer "$DESIGNER"))))

(defun current-repo-root ()
  (interactive)
  (let* ((my-path (or (buffer-file-name) default-directory))
         (my-root (repository-root my-path)))
    (cond
     ((equal my-root "~/.emacs.d/")
      "$GLOBAL")
     ((equal my-root "/Users/dylanconlin/dropbox/sites/shortstack-server/")
      "$SERVER")
     ((equal my-root "/Users/dylanconlin/Dropbox/sites/shortstack-designer/")
      "$DESIGNER")
     ((equal my-root "/Users/dylanconlin/Dropbox/sites/shortstack/")
      "$SHORTSTACK")
     (t "$GLOBAL"))))


(defun start-eshell-in-split-window (&optional initial-command)
  "start eshell in split window. you can feed it an optional initial command"
  (interactive)

  (if (buffer-exists? (current-repo-root))
      (progn
        (split-window-below-and-move-there-dammit)
        (switch-to-buffer (current-repo-root)))
    (split-window-below-and-move-there-dammit)
    (start-eshell))
  (if initial-command
      (progn
        (insert initial-command)
        (eshell-send-input))))


(defun buffer-exists? (bufname) (not (eq nil (get-buffer bufname))))

(defun grab-buffer (buffer-name)
  (interactive)
  (let ((my-buff buffer-name)
        (my-buffers (mapcar (function buffer-name) (buffer-list))))
    (-each my-buffers (lambda (item)
                        (cond
                         ((equal my-buff item)
                          (setq found-buffer t)
                          (switch-to-buffer item)))))))



(defun start-console-in-split-window ()
  "DOCSTRING"
  (interactive)
  (cond
   ((s-contains? "global" (rvm-activate-corresponding-ruby))
    (start-eshell-in-split-window "ruby -v"))
   ((s-contains? "server" (rvm-activate-corresponding-ruby))
    (start-eshell-in-split-window "ruby script/console"))
   ((s-contains? "designer" (rvm-activate-corresponding-ruby))
    (start-eshell-in-split-window "rails console"))
   (t (start-eshell-in-split-window "ruby script/console"))))

(add-hook 'eshell-mode-hook '(lambda ()
                               (local-set-key (kbd "C-a") 'eshell-bol-maybe-my)
                               (local-set-key (kbd "M-m") 'eshell-bol-maybe-my)
                               ))


(defun bol-maybe-general-my (prompt &optional alt-bol-fcn)
  ""
  (interactive)
  (if (and (string-match (concat "^" (regexp-quote prompt)
                                 " *$")
                         (buffer-substring-no-properties
                          (line-beginning-position)
                          (point)))
           (not (bolp)))
      (beginning-of-line)
    (if alt-bol-fcn
        (funcall alt-bol-fcn)
      (beginning-of-line)
      (search-forward-regexp prompt))))


(defun eshell-bol-maybe-my ()
  ""
  (interactive)
  (bol-maybe-general-my (funcall eshell-prompt-function)))



(setenv "PAGER" "cat")

;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; (defun make-my-shell-output-read-only (text)
;;   "Add to comint-output-filter-functions to make stdout read only in my shells."
;;   (if (member (buffer-name) my-shells)
;;       (let ((inhibit-read-only t)
;;             (output-end (process-mark (get-buffer-process (current-buffer)))))
;;         (put-text-property comint-last-output-start output-end 'read-only t))))
;; (add-hook 'comint-output-filter-functions 'make-my-shell-output-read-only)


 ;; (defmacro with-face (str &rest properties)
 ;;    `(propertize ,str 'face (list ,@properties)))
  
 ;;  (defun shk-eshell-prompt ()
 ;;    (let ((header-bg "#fff"))
 ;;      (concat
 ;;       (with-face (concat (eshell/pwd) " ") :background header-bg)
 ;;       (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#888")
 ;;       (with-face
 ;;        (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
 ;;        :background header-bg)
 ;;       (with-face "\n" :background header-bg)
 ;;       (with-face user-login-name :foreground "blue")
 ;;       "@"
 ;;       (with-face "localhost" :foreground "green")
 ;;       (if (= (user-uid) 0)
 ;;           (with-face " #" :foreground "red")
 ;;         " $")
 ;;       " ")))
 ;;  (setq eshell-prompt-function 'shk-eshell-prompt)
 ;;  (setq eshell-highlight-prompt nil)

(setenv "NODE_NO_READLINE" "1")

(provide 'eshell-setup)
