(require 'f)

(defun my-git-root ()
  (interactive)
  (vc-git-root default-directory))

(defun go-to-git-root ()
  (interactive)
  (find-file (my-git-root)))

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; Update emacs gui exec-path to match terminal.
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
   This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun do-nvm-use (version)
  (interactive "sVersion: ")
  (nvm-use version)
  (exec-path-from-shell-copy-env "PATH"))

(defun run-node (cwd)
  (interactive "DDirectory: ")
  (unless (executable-find "node")
    (call-interactively 'do-nvm-use))
  (let ((default-directory cwd))
    (pop-to-buffer (make-comint (format "node-repl-%s" cwd) "node" nil "--interactive"))))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun go-to-dired ()
  (interactive)
  (if (equal major-mode 'dired-mode)
      (dired-up-directory)
    (dired-jump)))

(defun dired-up ()
  (interactive)
  (if (equal major-mode 'dired-mode)
      (dired-single-buffer "..")
    (go-to-dired)))


(defun copy-full-path-to-kill-ring ()
  "If in \"dired-mode\", add the full path for file or dir under point to the kill ring.
Otherwise, add the current
 file's full path to kill ring"
  (interactive)
  (let ((my-path 
         (if (equal major-mode 'dired-mode)
             (concat (expand-file-name default-directory) (kill-new (dired-copy-filename-as-kill)))
           (if (null (buffer-file-name))
               (user-error "current buffer not assoc with file")
             (buffer-file-name)))))
    (progn 
      (message my-path)
      (kill-new my-path))))

(defun copy-current-git-file-path ()
  (interactive)
  (message "%s" (current-git-file-path))
  (kill-new (current-git-file-path)))

(defun this-is-a-git-repo? ()
  (interactive)
  (if (equal (my-git-root) nil)
      nil
    t))


(defun add-file-to-agignore ()
  (interactive)
  (let ((my-path 
         (if (equal major-mode 'dired-mode)
             (concat "/" (f-relative default-directory (my-git-root)) "\n")
           (if (null (buffer-file-name))
               (user-error "current buffer not assoc with file")
             (concat "/" (f-relative (buffer-file-name) (my-git-root)) "\n"))))
        (agignore (concat (my-git-root) ".agignore")))
    
    (if (y-or-n-p (concat "Add " my-path " to .agignore?"))
        (progn
          ;; if yes...
          (write-region my-path nil agignore 'append)
          (message "Added!"))
      (progn
        (message "Not added.")))))


(defun remove-file-from-agignore ()
  (interactive)
  (let ((my-path
         (if (equal major-mode 'dired-mode)
             (concat "/" (f-relative default-directory (my-git-root)) "\n")
           (if (null (buffer-file-name))
               (user-error "current buffer not assoc with file")
             (concat "/" (f-relative (buffer-file-name) (my-git-root)) "\n"))))
        (agignore (concat (my-git-root) ".agignore")))
    (if (y-or-n-p (concat "Remove " my-path " from .agignore?"))
        (progn
          ;; if yes...
          (f-write-text
           (replace-regexp-in-string (regexp-quote my-path) "" (f-read-text agignore 'utf-8) nil 'literal)
           'utf-8
           agignore)
          
          (message "Removed!"))
      (progn
        (message "Not removed.")))))

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))


(defun windows-flip ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

(defun split-window-below-and-move-there-dammit ()
  (interactive)
  (split-window-vertically)
  (windmove-down))

(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (org-mode)
    ))

(defun open-dir-in-finder ()
  (interactive)
  (eshell-command "open ."))

(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun reopen-last-closed-buffer ()
  (interactive)
  (find-file (car recentf-list)))

(defun to-coffee (start end)
  "Convert JavaScript in the region into CoffeeScript."
  (interactive "r")
  (coffee-js2coffee-replace-region start end))

;; (defun to-haml (start end)
;;   "run html2haml on current buffer"
;;   (interactive "r")
;;   (coffee-js2coffee-replace-region start end))
;;   (setf filename buffer-file-name)
;;   (setf newfilename (concat
;;                   (car (split-string filename "\\.")) ".html.haml"))
;;   (save-buffer)
;;   (shell-command (concat
;;                "html2haml " filename " > " newfilename))
;;   (kill-buffer (current-buffer))
;;   (delete-file filename)
;;   (find-file newfilename))

(defun to-javascript (start end)
  "Convert JavaScript in the region into CoffeeScript."
  (interactive "r")
  (coffee-compile-region start end))

(defun git-root-dir-only ()
  (interactive)
  (f-filename (my-git-root)))

(defun line-number-blob (line-param)
  "prepends the line-param to the current line
   number occupied by the cursor"
  (s-concat line-param (number-to-string (line-number-at-pos))))

(when buffer-file-name
  (git-root-dir-only)
  (message (file-truename buffer-file-name)))

;; TODO: rewrite this using the following shell command:
;; git --git-dir=.git config --get remote.github.url
(defun browse-file-on-github ()
  (interactive)
  (when buffer-file-name
    (browse-url (s-concat  (f-join "https://github.com/pancakelabs" (git-root-dir-only) "blob" "staging" (file-relative-name buffer-file-name (f-join "~/Dropbox/sites" (git-root-dir-only)))) (line-number-blob "#L")))))

;; (defun github-source (start end)
;;   (interactive "r")
;;   (browse-url
;;    (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (get-region start end) "?expand=1")))

;; ;; https://github.com/pancakelabs/shortstack-designer/blob/staging/script/rails#L4


(defun replace-smart-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))


(defun helm-yank-selection (arg)
  "Set minibuffer contents to current display selection.
With a prefix arg set to real value of current selection."
  (interactive "P")
  (let ((str (helm-get-selection nil (not arg))))
    (kill-new (car (last (s-split ":    " (car (last (s-split-up-to ":*:" str 2)))))))
    (helm-set-pattern str)))

;; (defun open-line-below ()
;;   (interactive)
;;   (end-of-line)
;;   (newline)
;;   (indent-for-tab-command))

;; (defun open-line-above ()
;;   (interactive)
;;   (beginning-of-line)
;;   (newline)
;;   (forward-line -1)
;;   (indent-to (previous-nonblank-indent-value)))

(defun open-line-above ()
  "Open a line above the line the point is at.
Then move to that line and indent according to mode"
  (interactive)
  (cond ((or (eq major-mode 'coffee-mode) (eq major-mode 'feature-mode))
         (let ((column
                (save-excursion
                  (back-to-indentation)
                  (current-column))))
           (move-beginning-of-line 1)
           (newline)
           (forward-line -1)
           (move-to-column column t)))
        (t
         (move-beginning-of-line 1)
         (newline)
         (forward-line -1)
         (indent-according-to-mode))))

(defun open-line-below ()
  "Open a line below the line the point is at.
Then move to that line and indent according to mode"
  (interactive)
  (cond ((or (eq major-mode 'coffee-mode) (eq major-mode 'feature-mode))
         (let ((column
                (save-excursion
                  (back-to-indentation)
                  (current-column))))
           (move-end-of-line 1)
           (newline)
           (move-to-column column t)))
        (t
         (move-end-of-line 1)
         (newline)
         (indent-according-to-mode))))

(defun my-kill-line ()
  (interactive)
  ;; (cond ((or (eq major-mode 'coffee-mode) (eq major-mode 'feature-mode))

  (kill-line))

(defun only-whitespace-before-cursor? ()
  (interactive)
  (if (looking-back "^\s*")
      (progn
        (message "yes")
        t)
    (message "no")
    nil))

(defun vi-open-line (&optional abovep)
  "Insert a newline below the current line and put point at beginning.
With a prefix argument, insert a newline above the current line."
  (interactive "P")
  (if abovep
      (vi-open-line-above)
    (vi-open-line-below)))

(defun previous-nonblank-indent-value ()
  "Return the indentation level of the previous non-blank line."
  (interactive)
  (save-excursion
    (forward-line -1)
    (if (bobp)
        0
      (progn
        (while (and (looking-at "^[ \t]*$") (not (bobp))) (forward-line -1))
        (current-indentation)))))

(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{" 1) (looking-at "}"))
                             (and (looking-back ">" 1) (looking-at "<"))
                             (and (looking-back "(" 1) (looking-at ")"))
                             (and (looking-back "\\[" 1) (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))


(defun view-on-github ()
  (interactive)
  (message (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (magit-get-current-branch) "?expand=1"))
  (if (equal "shortstack-style" (git-root-dir-only))
      (browse-url (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/master..." (magit-get-current-branch) "?expand=1"))
    (browse-url (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (magit-get-current-branch) "?expand=1"))))



(defun view-original-on-github ()
  (interactive)
  (let ((current-git-path (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/blob/master/" (current-git-file-path))))
    (browse-url current-git-path)))

(defun current-git-file-path ()
  (interactive)
  (car (cdr (s-split (s-concat "/" (git-root-dir-only) "/") (f-this-file)))))

;; (defun view-on-github (start end)
;;   (interactive "r")
;;   (if (get-region start end)
;;       (browse-url (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (get-region start end) "?expand=1"))
;;     (progn
;;       (message (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (magit-get-current-branch) "?expand=1"))
;;       (browse-url (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (magit-get-current-branch) "?expand=1")))))


(defun get-region (beg end)
  "message region or \"empty string\" if none highlighted"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (let ((my-region (if (and beg end)
                       (buffer-substring-no-properties beg end)
                     (message "%s" "Please select a region first!")
                     nil)))
    my-region))

(defun js-logger (beg end)
  "message region or \"empty string\" if none highlighted"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (let ((my-region (if (and beg end)
                       (buffer-substring-no-properties beg end)
                     (insert (format-js-logger (current-kill 0))))))
    (kill-new (format-js-logger my-region))
    (deactivate-mark)))

(defun format-js-logger (my-region)
  (concat "console.log('" my-region ": ', " my-region ")"))

;; (defun get-region (beg end)
;;   "message region or \"empty string\" if none highlighted"
;;   (interactive (if (use-region-p)
;;                    (list (region-beginning) (region-end))
;;                  (list nil nil)))
;;   (message "%s" (if (and beg end)
;;                     (buffer-substring-no-properties beg end)
;;                   "Please select a region first!")))

(defun find-git-root (&optional dir)
  (interactive)
  (unless dir (setq dir (f-dirname (buffer-file-name))))
  (let ((parent (f-parent dir)))
    (unless (f-root? parent)
      (if (f-exists? (f-expand ".git" dir))
          dir
        (find-git-root parent)))))

(defun csv-to-org-table ()
  (interactive)
  (if (equal "csv" (f-ext buffer-file-name))
      (org-table-convert-region (point-min) (point-max))))

(defun shortstack-startup ()
  (interactive)
  (shell-command (s-concat "osascript " user-emacs-directory "applescripts/work-environment-setup.applescript")))

(defun itunes-star-song ()
  (interactive)
  (shell-command "osascript /Users/dylanconlin/drive/star-song.applescript"))

(defun karabiner-enable (beg end)
  (interactive "r")
  (let ((region (get-region beg end)))
    (shell-command (s-concat "karabiner enable " "\""region"\""))))

(defun karabiner-disable (beg end)
  (interactive "r")
  (let ((region (get-region beg end)))
    (shell-command (s-concat "karabiner disable " "\""region"\""))))

(defun karabiner-reload ()
  (interactive)
  (shell-command "karabiner reloadxml"))

;; how to map over list in elisp
;; (mapcar (lambda (arg) (s-concat "dog " arg))  '("lover" "hater"))

(defun my-tail ()
  (interactive)
  (cond ((my-project-is "shortstack-server")
         (itail (f-join (my-git-root) "log" "development.log")))
        ((my-project-is "shortstack")
         (itail (f-join (my-git-root) "log" "development.log")))
        ((my-project-is "shortstack-designer")
         (itail (f-join (my-git-root) "log" "development.log")))
        ((message "please specify a log file for this project in the my-tail function"))))

(defun my-project-is (project-name)
  "returns t if project-name matches the project's git root folder name"
  (interactive)
  (s-equals? (f-filename (my-git-root)) project-name))

(defun my-git-root-is-print ()
  (interactive)
  (message (my-git-root)))



(defun copy-mac-app-id (beg end)
  (interactive "r")
  (let* ((region (get-region beg end))
         (app-id (shell-command-to-string (s-concat "osascript -e 'id of app" "\""region"\"'"))))
    (kill-new app-id)
    (message app-id)))

(defun show-buffer-starting-with (some-string)
  (interactive)
  (let ((buffer-names (mapcar (lambda (b) (buffer-name b)) (buffer-list))))
    (switch-to-buffer (first (-filter (lambda (b) (buffer-name-starts-with some-string b)) buffer-names)))))

(defun buffer-name-starts-with (some-string b)
  (interactive)
  (s-equals? (s-left 5 b) some-string))

(defun stream-movie (beg end)
  (interactive "r")
  (let* ((region (get-region beg end))
         (magnet (shell-command-to-string
                  (s-concat "node /Users/dylanconlin/drive/side-sites/kickass/index.js " "\""region"\""))))
    (async-shell-command (s-concat "peerflix " "\""magnet"\" --vlc"))))

;; the central park five 2012
;; Corman's World: Exploits of a Hollywood Rebel 2011
;; Crazy Love 2007
;; Dark Days 2000
;; Deep Water 2006

;; eddie izzard: circle 2002
;; The Great Happiness Space: Tale of an Osaka Love Thief 2006
;; high school 1968
;; heima 2007
;; toy story
;; the departed

;; clue



(defun edit-cvimrc (args)
  (interactive "P")
  (gist-fetch "b48425a2bfa9fde27543"))

;; (defun test-it (args)
;;   (interactive "P")
;;   )
(defun yank-chrome-url ()
  "Yank current URL from Chrome"
  (interactive)
  (require 'apples-mode)
  (apples-do-applescript "tell application \"Google Chrome\" get URL of active tab of first window end tell"
                         #'(lambda (url status script)
                             ;; comes back with quotes which we strip off
                             (insert (subseq url 1 (1- (length url)))))))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

;; Roughly speaking, the after macro specifies code to run when the specified feature
;; (e.g., python in the above examples) loads from the file. If the feature is already
;; loaded the code runs immediately.

;; e.g.
;; Normally if you want something to load after a feature (package) loads you do something like,

;; (eval-after-load 'python
;;   (progn
;;     (message "python has been loaded")
;;     (local-set-key (kbd "M-n") 'flymake-goto-next-error)
;;     (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))
;; and using the after macro just cleans things up a bit,

;; (after `python
;;   (message "python has been loaded")
;;   (local-set-key (kbd "M-n") 'flymake-goto-next-error)
;;   (local-set-key (kbd "M-p") 'flymake-goto-prev-error))

(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

;; (defun open-in-iterm ()
;;   (interactive)
;;   (kill-new (s-concat "cd " (shell-quote-argument (f-full (s-trim (first (s-match " .*" (my-git-root)))))) "\r"))
;;   (shell-command (s-concat "osascript " user-emacs-directory "applescripts/open-iterm.applescript")))

(defun open-in-iterm ()
  (interactive)
  (kill-new (s-concat "cd " (my-git-root) "\r"))
  (shell-command (s-concat "osascript " user-emacs-directory "applescripts/open-iterm.applescript")))

(defun clipboard-youtube-mp3 ()
  (interactive)
  (with-temp-buffer
    (insert "hello")
    (clipboard-kill-region (point-min) (point-max)))
  (shell-command (s-concat "youtube-dl --extract-audio --audio-format mp3 " )))


(defun email-friends (subject body recipient)
  ;; in sSubject, the s stands for string. in \nsBody, the \n indicated multiple interactive args are expected.
  (interactive "sSubject: \nsBody: \nsTo: ")
  ;; (shell-quote-argument) should always go inside s-concat.
  (shell-command
   (s-concat "coffee ~/drive/side-sites/node-projects/emailer/mailer.coffee "
             (shell-quote-argument subject) " " (shell-quote-argument body) " " (shell-quote-argument recipient))))


(defun char-upcase-p (letter)
  "returns true if char is upcase"
  (eq letter (upcase letter)))

(defun capitalize-word-toggle ()
  (interactive)
  (let ((start
         (car (save-excursion
                (backward-word)
                (bounds-of-thing-at-point 'symbol)))))
    (if start
        (save-excursion
          (goto-char start)
          (funcall
           (if (char-upcase-p (char-after))
               'downcase-region
             'upcase-region)
           start (1+ start)))
      (capitalize-word -1))))


(defun hue-lights-are-on-p ()
  (s-matches-p "on" (shell-command-to-string "hue lights 2")))

(defun hue-lights-toggle ()
  (interactive)
  (if (hue-lights-are-on-p)
      (shell-command "hue lights all off")
    (shell-command "hue lights all on")))



(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode js2-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun start-eshell-in-split-window (&optional initial-command)
  "start eshell in split window. you can feed it an optional initial command"
  (interactive)
  (split-window-below-and-move-there-dammit)
  (eshell 1))


;; (defun fg-emms-track-description (track)
;;   "Return a somewhat nice track description."
;;   (let ((artist (emms-track-get track 'info-artist))
;;         (year (emms-track-get track 'info-year))
;;         (album (emms-track-get track 'info-album))
;;         (tracknumber (emms-track-get track 'info-tracknumber))
;;         (title (emms-track-get track 'info-title)))
;;     (cond
;;      ((or artist title)
;;       (concat
;;        (format-as-column 6  0  (format "% 3d" (string-to-number tracknumber)))
;;        (format-as-column 30 30 title)
;;        (format-as-column 30 30 artist)
;;        (format-as-column 30 30 album)
;;        (format-as-column 30 30 year)
;;        ))
;;      (t
;;       (emms-track-simple-description track)))))

;; (defun emms-mode-line-playlist-current ()
;;   "Format the currently playing song."
;;   (let ((track (emms-track-get (emms-playlist-current-selected-track) 'info-title))
;;         (artist (emms-track-get (emms-playlist-current-selected-track) 'info-artist)))
;;     (format emms-mode-line-format (concat track " - " artist))))

;; (defun format-as-column (width right-padding field)
;;   (s-truncate width (s-pad-right right-padding " " (concat "   " (if (> (length field) 0) field "----")))))

(defun soulseek-playlist ()
  (interactive)
  (let ((songs (f-files "/Users/dylanconlin/Downloads/Soulseek Downloads/complete" nil t)))
    ;; (emms-playlist-current-clear)
    (-map (lambda (song) (emms-add-file song)) songs)
    (emms)))

(defun soulseek-move-songs ()
  (interactive)
  (let ((songs (f-files "/Users/dylanconlin/Soulseek Downloads/complete" nil t)))
    (-map (lambda (song) (move-song-to-new-dir song)) songs)))


(defun move-song-to-new-dir (s)
  (f-move s (soulseek-new-dir s)))

(defun soulseek-new-dir (song)
  (s-concat "/Users/dylanconlin/Soulseek Downloads/soulseek-songs" (f-filename song)))

(defun emms-soulseek ()
  (interactive)
  (emms-add-directory "~/Downloads/Soulseek Downloads/soulseek-songs/")
  (emms))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq correct-ruby-is-active nil)

(defadvice ruby-test-run-command (around ruby-test-run-command-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    (unless correct-ruby-is-active
      (if (fboundp 'rvm-activate-corresponding-ruby)
          (rvm-activate-corresponding-ruby)))
    (setq correct-ruby-is-active t)
    ad-do-it))

(ad-activate 'ruby-test-run-command)

;;(defun squash-whitespace ()
;;  (interactive)
;;  (save-excursion
;;    (let ((beg (point))) (evil-forward-word-begin) (delete-region beg (point)))))


(defun cache-last-open-file ()
  (interactive)
  (let ((current-file-path (if (equal major-mode 'dired-mode)
                               default-directory
                             (expand-file-name buffer-file-name user-emacs-directory)))
        (cache-path (concat user-emacs-directory ".last-opened-file")))
    (f-write current-file-path 'utf-8  cache-path)))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun open-last-visited-file ()
  (interactive)
  (find-file (get-string-from-file (expand-file-name ".last-opened-file" user-emacs-directory))))

(defun point-at-beginning-of-word? ()
  (interactive)
  (and (looking-at "[a-zA-z]") (looking-back " " 1)))

(defun my-mark-word ()
  (interactive)
  ;; go to beginning of word
  (while (not (point-at-beginning-of-word?))
    (backward-char 1)))

(defun string-wrap-interpolate (start end)
  "Insert a #{..} around a region."
  (interactive "r")
  (let ((region (get-region start end)))
    (save-excursion
      (goto-char end) (insert "}")
      (goto-char start) (insert "#{"))))

(defun my-recentf ()
  (interactive)
  (if (this-is-a-git-repo?)
       (helm-projectile-recentf)
     (helm-recentf)))

(defun my-helm-do-ag ()
  (interactive)
  (helm-do-ag-project-root))

(defun my-helm-project-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  ;;  (unless (and helm-source-ls-git-status
  ;;               helm-source-ls-git)
  ;;    (setq helm-source-ls-git-status
  ;;          (helm-make-source "Git status" 'helm-ls-git-status-source
  ;;            :fuzzy-match helm-ls-git-fuzzy-match)
  ;;          helm-source-ls-git))
  (if (this-is-a-git-repo?)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm :sources '(
                         helm-source-projectile-buffers-list
                         helm-source-projectile-files-list
                         helm-source-bookmarks
                         )
              :buffer "*project-search*"
              :prompt (projectile-prepend-project-name "pattern: ")))
    (helm-projectless-search)))

(defun helm-projectless-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources '(helm-source-buffers-list
                     helm-source-bookmarks
                     )
          :buffer "*project(less)-search*"
          :prompt (projectile-prepend-project-name "pattern: "))))


(defun ruby-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Ruby" "Ruby on Rails")))

(defun javascript-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "JQuery" "UnderscoreJS" "Jasmine" "NodeJS")))

(defun coffee-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "CoffeeScript" "KnockoutJS" "UnderscoreJS" "Jasmine" "NodeJS")))

(defun css-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS" "SASS")))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(defun run-current-file ()
  "run the current file according to its extension"
  (interactive)
  (let ((current-file-extension (f-ext (when buffer-file-name (file-truename buffer-file-name)))))
    (cond ((equal current-file-extension "coffee")
           (async-shell-command (concat "coffee " (f-filename buffer-file-name)) '(4) nil))
          ((equal current-file-extension "js")
           (async-shell-command (concat "babel-node " (f-filename buffer-file-name)) '(4) nil))
          ((equal current-file-extension "rb")
           (async-shell-command (concat "ruby " (f-filename buffer-file-name)) '(4) nil)))))

(defun my-previous-edit (arg)
  (interactive "p")
  (git-gutter:previous-hunk arg)
  (recenter))

(defun my-next-edit (arg)
  (interactive "p")
  (git-gutter:next-hunk arg)
  (recenter))

(defun youtube-dl-as-song ()
  (interactive)
  (let* ((str (current-kill 0))
         (default-directory "~/youtube-downloads/audio"))
    (async-shell-command
     (s-concat "cd ~/youtube-downloads/audio && youtube-dl --extract-audio --audio-format mp3 \"" str "\""))))

(defun youtube-dl-as-video ()
  (interactive)
  (let* ((str (current-kill 0))
         (default-directory "~/youtube-downloads/audio"))
    (async-shell-command
     (s-concat "cd ~/youtube-downloads/video && youtube-dl \"" str "\""))))

(defun rspec-test-at-current-line-number ()
  "build the command rspec requires to run a test at a 
  specific line. This only works in shortstack projects using
  rspec (v1)"
  (interactive)
  (let ((test-command (s-concat "spec "  (car (last (s-slice-at "spec/" (copy-full-path-to-kill-ring)))) (line-number-blob ":"))))
    (message test-command)
    (kill-new test-command)))

(defun minitest-test-at-current-line-number ()
  "build the command rspec requires to run a test at a 
  specific line. This only works in shortstack projects using
  minitest"
  (interactive)
  (let ((test-command (s-concat "ruby -I test "  (car (last (s-slice-at "test/" (copy-full-path-to-kill-ring)))) " --name /my_active_test/")))
    (message test-command)
    (kill-new test-command)))

(defun text-myself ()
  (interactive)
  (let* ((link (current-kill 0)))
    (async-shell-command
     (s-concat "/Users/dylanconlin/.nvm/versions/node/v5.3.0/bin/node /Users/dylanconlin/Dropbox/side-sites/node-projects/twilio-test/app.js " link))))

(defun ruby-comment-gap ()
  (interactive)
  (insert "puts \"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\""))

(defun unwrap-item (start end)
  "remove markup \begin{itemize}\end{itemize} around a region."
  (interactive "r")
  (save-excursion
    (word-search-backward "puts\s\"xxxxx")
    (kill-whole-line)
    (word-search-forward "puts\s\"xxxxx")
    (kill-whole-line)))
  
(defun wrap-item (start end)
  "Insert a markup \begin{itemize}\end{itemize} around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "\nputs \"xxxxx___________________________________________________________________________________________________\"")
    (goto-char start) (insert "puts \"xxxxx___________________________________________________________________________________________________\"\n")))

(defun wrappy ()
  "Change me!"
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (set-mark-command nil)
    (move-end-of-line 1)
    (wrap-item (region-beginning) (region-end))
    (search-backward-regexp "puts")
    (indent-for-tab-command nil)
    (move-end-of-line 1)
    (search-forward-regexp "puts")
    (indent-for-tab-command nil)))

;; ;; QuickLookでファイルを開く
;; (defun dired-quicklook ()
;;   (interactive)
;;   (let ((file (s-concat default-directory (dired-copy-filename-as-kill))))
;;     (message file)
;;     (unless (file-directory-p file)
;;       (shell-command (s-concat "qlmanage -p " (shell-quote-argument file))))))



;; (defun my-put-file-name-on-clipboard ()
;;   "Put the current file name on the clipboard"
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       (s-concat default-directory (dired-copy-filename-as-kill))
;;                     (buffer-file-name))))
;;     (when filename
;;       (with-temp-buffer
;;         (insert filename)
;;         (clipboard-kill-region (point-min) (point-max)))
;;       (message filename))))

;; (eval-after-load  "Dired"
;;   '(define-key dired-mode-map (kbd "C-c y") 'dired-quicklook))

(defun my/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))

(defun my/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))

;; start a httpd-server in current directory
(defun httpd-start-here (directory port)
  (interactive (list (read-directory-name "Root directory: " default-directory nil t)
                     (read-number "Port: " 8017)))
  (setq httpd-root directory)
  (setq httpd-port port)
  (httpd-start)
  (browse-url (concat "http://localhost:" (number-to-string port) "/")))

(defun uniquify-all-lines-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))
 

  (defun uniquify-all-lines-buffer ()
    "Delete duplicate lines in buffer and keep first occurrence. This is
nice when uniqifying your bash or zsh history"
    (interactive "*")
    (uniquify-all-lines-region (point-min) (point-max)))

;; (defhydra hydra-launcher (:color blue)
;;   "Launch"
;;   ("h" man "man")
;;   ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
;;   ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
;;   ("s" shell "shell")
;;   ("q" nil "cancel"))
;; (global-set-key (kbd "C-c r") 'hydra-launcher/body)

(defun decrypt-and-copy-to-clipboard ()
  (interactive)
  (let* ((encrypted-file "/Users/dylanconlin/.emacs.d/.encrypted-file")
         (unencrypted-file "/Users/dylanconlin/.emacs.d/.unencrypted-file")
         (hash (current-kill 0)))
    (f-touch unencrypted-file)
    ;; write encrypted blob to file
    (f-write hash 'utf-8 encrypted-file)
    (f-read encrypted-file 'utf-8)
    ;; decrypt blob
    (epa-decrypt-file encrypted-file unencrypted-file)
    ;; add to clipboard
    (kill-new (f-read unencrypted-file 'utf-8))
    ;; delete files
    (f-delete encrypted-file)
    (f-delete unencrypted-file)
    ))


(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))

(defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
(defun lower-camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
(defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))
(defun dasherize  (s) (mapconcat 'downcase   (split-name s) "-"))
(defun colonize   (s) (mapconcat 'capitalize (split-name s) "::"))


(defun camel-snake-toggle-word-at-point ()
  (interactive)
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
         (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
         (txt (buffer-substring beg end))
         (cml (camel-snake-toggle txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))


(defun camel-snake-toggle (s)	
  (cond ((string-match-p "_"  s) (concat (downcase (substring (lower-camelcase s) 0 1)) (substring (lower-camelcase s) 1)))
        (t                          (underscore s)) ))

;; other options i'm not using
;; ((string-match-p "-" s)     (colonize s))
;; ((string-match-p "_" s)	(dasherize s))

(defun calc-eval-region (arg)
  "Evaluate an expression in calc and communicate the result.
If the region is active evaluate that, otherwise search backwards
to the first whitespace character to find the beginning of the
expression. By default, replace the expression with its value. If
called with the universal prefix argument, keep the expression
and insert the result into the buffer after it. If called with a
negative prefix argument, just echo the result in the
minibuffer."
  (interactive "p")
  (let (start end)
    (if (use-region-p)
        (setq start (region-beginning) end (region-end))
      (progn
        (setq end (point))
        (setq start (search-backward-regexp "\\s-\\|\n" 0 1))
        (setq start (1+ (if start start 0)))
        (goto-char end)))
    (let ((value (calc-eval (buffer-substring-no-properties start end))))
      (pcase arg
        (1 (delete-region start end))
        (4 (insert " = ")))
      (pcase arg
        ((or 1 4) (insert value))
        (-1 (message value))))))

(bind-key "C-=" 'calc-eval-region)

(defun ruby-deactivate-test (active-test-string)
  (save-excursion
    (goto-char (line-beginning-position))
    (while (re-search-forward active-test-string (line-end-position) t)
      (replace-match "" nil nil))))

(defun ruby-activate-test (active-test-string)
  (save-excursion
    (goto-char (line-beginning-position))
    (while (re-search-forward "[it|describe] ['|\"]" (line-end-position) t 1)
      (insert active-test-string))))


(defun ruby-toggle-active-test ()
  (interactive)
  (let ((my-active-test-string "my_active_test "))
    (save-excursion
      (goto-char (line-beginning-position))
      
      (if (re-search-forward my-active-test-string (line-end-position) t)
          (progn 
            (ruby-deactivate-test my-active-test-string))
        (ruby-activate-test my-active-test-string)))))

(defun ruby-deactivate-all-tests ()
  (interactive)
  (let ((my-active-test-string "my_active_test "))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward my-active-test-string (point-max) t)
        (replace-match "" nil nil)))))


;; (defun a-test-save-hook()
;;   "Test of save hook"
;;   (when (editing-chrome-extension-p)
;;     (browse-url "http://reload.extensions")))


;; (remove-hook 'after-save-hook 'a-test-save-hook)

;; (defun editing-chrome-extension-p ()
;;   (interactive)
;;   (not (equal nil (f-traverse-upwards
;;                   (lambda (path)
;;                     (f-exists? (f-expand "manifest.json" path)))
;;                   (expand-file-name default-directory)))))


(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%m-%d-%y)")))

(defun func-region (start end func)
  "run a function over the region between START and END in current buffer."
  (save-excursion
    (let ((text (delete-and-extract-region start end)))
      (insert (funcall func text)))))

(defun encode-region (start end)
  "urlencode the region between START and END in current buffer."
  (interactive "r")
  (func-region start end #'org-link-escape))

(defun decode-region (start end)
  "decode the region between START and END in current buffer."
  (interactive "r")
  (func-region start end #'org-link-unescape))



(provide 'utilities-setup)
