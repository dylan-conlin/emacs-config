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
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name)))
  (message (file-truename buffer-file-name)))


(defun switch-to-old-emacs ()
  (interactive)
  (f-move "~/drive/dotfiles/.emacs.d" "~/drive/dotfiles/.emacs.d-new")
  (f-move "~/drive/dotfiles/.emacs.d-old" "~/drive/dotfiles/.emacs.d"))

(defun switch-to-new-emacs ()
  (interactive)
  (f-move "~/drive/dotfiles/.emacs.d" "~/drive/dotfiles/.emacs.d-old")
  (f-move "~/drive/dotfiles/.emacs.d-new" "~/drive/dotfiles/.emacs.d"))

(defun this-is-a-git-repo? ()
  (interactive)
  (if (equal (my-git-root) nil)
      nil
    t))

(defun windows-swap ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (car (window-list)))
           (w2 (cadr (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))

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

(defun to-javascript (start end)
  "Convert JavaScript in the region into CoffeeScript."
  (interactive "r")
  (coffee-compile-region start end))

(defun git-root-dir-only ()
  (f-filename (my-git-root)))

(defun line-number-on-github ()
  (s-concat "#L" (number-to-string (line-number-at-pos))))

(when buffer-file-name
  (git-root-dir-only)
  (message (file-truename buffer-file-name)))

;; TODO: rewrite this using the following shell command:
;; git --git-dir=.git config --get remote.github.url
(defun browse-file-on-github ()
  (interactive)
  (when buffer-file-name
    (browse-url (s-concat  (f-join "https://github.com/pancakelabs" (git-root-dir-only) "blob" "staging" (file-relative-name buffer-file-name (f-join "~/drive/sites" (git-root-dir-only)))) (line-number-on-github)))))

(defun replace-smart-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))


(defun my-helm-yank-selection (arg)
  "Set minibuffer contents to current display selection.
With a prefix arg set to real value of current selection."
  (interactive "P")
  (let ((str (helm-get-selection nil (not arg))))
    (kill-new (car (last (s-split ":    " (car (last (s-slice-at ": +?" str)))))))
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


(defun view-on-github (start end)
  (interactive "r")
  (browse-url
   (s-concat "https://github.com/pancakelabs/" (git-root-dir-only) "/compare/staging..." (get-region start end) "?expand=1")))

(defun get-region (beg end)
  "message region or \"empty string\" if none highlighted"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (if (and beg end)
      (buffer-substring-no-properties beg end)
    "xxx"))

(defun my-git-root ()
  (interactive)
  (vc-git-root default-directory))

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

(defun open-in-iterm ()
  (interactive)
  (kill-new (s-concat "cd " (shell-quote-argument (f-full (s-trim (first (s-match " .*" (pwd)))))) "\r"))
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
  (multi-eshell 1))


(defun fg-emms-track-description (track)
  "Return a somewhat nice track description."
  (let ((artist (emms-track-get track 'info-artist))
        (year (emms-track-get track 'info-year))
        (album (emms-track-get track 'info-album))
        (tracknumber (emms-track-get track 'info-tracknumber))
        (title (emms-track-get track 'info-title)))
    (cond
     ((or artist title)
      (concat
       (format-as-column 6  0  (format "% 3d" (string-to-number tracknumber)))
       (format-as-column 30 30 title)
       (format-as-column 30 30 artist)
       (format-as-column 30 30 album)
       (format-as-column 30 30 year)
       ))
     (t
      (emms-track-simple-description track)))))

(defun emms-mode-line-playlist-current ()
  "Format the currently playing song."
  (let ((track (emms-track-get (emms-playlist-current-selected-track) 'info-title))
        (artist (emms-track-get (emms-playlist-current-selected-track) 'info-artist)))
    (format emms-mode-line-format (concat track " - " artist))))

(defun format-as-column (width right-padding field)
  (s-truncate width (s-pad-right right-padding " " (concat "   " (if (> (length field) 0) field "----")))))

(defun soulseek-playlist ()
  (interactive)
  (let ((songs (f-files "/Users/dylanconlin/Soulseek Downloads/complete" nil t)))
    (emms-playlist-current-clear)
    (-map (lambda (song) (emms-add-file song)) songs)
    (emms)))

(defun move-song-to-new-dir (s)
  (f-move s (soulseek-new-dir s)))

(defun soulseek-new-dir (song)
  (s-concat "/Users/dylanconlin/Soulseek Downloads/soulseek-songs/" (f-filename song)))

(defun emms-soulseek ()
  (interactive)
  (emms-add-directory "~/Soulseek Downloads/soulseek-songs/")
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

(defun squash-whitespace ()
  (interactive)
  (save-excursion
    (let ((beg (point))) (evil-forward-word-begin) (delete-region beg (point)))))

(provide 'utilities-setup)
