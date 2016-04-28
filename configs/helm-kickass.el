;; (require 'json)
(require 'helm)

(defun alist-get (symbols alist)
  "Look up the value for the chain of SYMBOLS in ALIST"
  (if symbols
      (alist-get (cdr symbols)
                 (assoc (car symbols) alist))
    (cdr alist)))

(defun kickass-search (search-term)
  "Search kickass for SEARCH-TERM, returning the results as a Lisp structure."
  (let ((a-url (format "http://kat.cr/json.php?order=desc&page=1&q=%s" search-term)))
    (with-current-buffer
	(url-retrieve-synchronously a-url)
      (goto-char url-http-end-of-headers)
      (json-read))))

(defun kickass-format-torrent (torrent)
  "Given a torrent, return a a formatted string suitable for display."
  (let* ((torrent-title (alist-get '(title) torrent))
         (torrent-seeds (alist-get '(seeds) torrent))
         (torrent-pubdate (alist-get '(pubDate) torrent))
         (torrent-link (alist-get '(torrentLink) torrent)))
    (format "%d - %s - %s" torrent-seeds torrent-title torrent-pubdate)))
  
(defun kickass-search-formatted (search-term)
  (mapcar (lambda (torrent)
	    (cons (kickass-format-torrent torrent) torrent))
	  (alist-get '(list) (kickass-search search-term))))

(defun helm-kickass-search ()
  (kickass-search-formatted helm-pattern))

(defun helm-kickass-persistent-action (candidate)
  (message-box "%s" candidate))

;;;###autoload
(defvar helm-source-kickass-torrent-search
  '((name . "Kickass")
    (volatile)
    (delayed . 0.5)
    (requires-pattern . 2)
    (candidates-process . helm-kickass-search)
    (action-transformer . helm-spotify-actions-for-track)))

;;;###autoload
(defun helm-kickass ()
  "Bring up a kickass search interface in helm."
  (interactive)
  (helm :sources '(helm-source-kickass-torrent-search)
	:buffer "*helm-kickass*"))
     
(defun helm-spotify-actions-for-track (track)
  "Return a list of helm ACTIONS available for this TRACK."
  '((,(format "Play Track - %s" (alist-get  '(name) track))       . spotify-play-track)
    (,(format "Play Album - %s" (alist-get '(album name) track)) . spotify-play-album)
    ("Show Track Metadata" . pp)))

;; (defun helm-kickass-actions-for-torrent (actions torrent)
;;   "Return a list of helm ACTIONS available for this TORRENT."
;;   '(("this on" . (lambda (candidate) (message-box "%s" candidate))))
;;   )
;;   ;; '((,(format "Stream - %s" (alist-get '(title) torrent)) . kickass-stream-torrent)
;;   ;;   (,(format "Save - %s" (alist-get '(title) torrent)) . kickass-save-torrent)
;;   ;;   ("Show Track Metadata" . pp)))

(provide 'helm-kickass)
;;; helm-kickass.el ends here
