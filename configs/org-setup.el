(require 'org)
(require 'org-install)
(require 'org-crypt)
(require 'gnus-async)

;; prettier appearance settings
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-hide-leading-starts t)

;; behavior settings
(setq org-use-fast-todo-selection t)

;; setup org path
(setq org-default-notes-file (expand-file-name "~/Dropbox/org/notes.org"))


;; setup files agenda is aware of
(setq org-agenda-files '("~/Dropbox/org/code.org"
                         "~/Dropbox/org/notes.org"
                         "~/Dropbox/org/shortstack.org"
                         "~/Dropbox/org/journal.org"
			 "~/Dropbox/org/todo.org"))


(setq org-capture-templates
      '(
        ("c" "Code" entry (file+headline "~/Dropbox/org/code.org" "Code") "* %^{title} %^g \n %? \n%U")
        ;; ("o" "Contacts" entry (file "~/Dropbox/org/contacts.org") "* %(org-contacts-template-name)\n:PROPERTIES:\n%(org-contacts-template-email)\n:END:")
        ;; ("e" "Email" entry (file+headline "~/Dropbox/org/emails.org" "Emails") "* %^{title} %^g \n %? \n%U")
        ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes") "* %^{title} %^g \n %? \n%U")
	("j" "Journal" entry (file+headline "~/Dropbox/org/journal.org" "Journal") "* %^{title} %^g \n %? \n%U")
        ("s" "Shortstack" entry (file+headline "~/Dropbox/org/shortstack.org" "Shortstack") "* %^{title} %^g \n %? \n%U")
        ("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Tasks") "* TODO %^{title} %^g \n %? \n%U")))


(setq org-refile-targets
      '(
        ("~/Dropbox/org/notes.org" . (:level . 1))
        ("~/Dropbox/org/todo.org" . (:level . 1))
        ("~/Dropbox/org/shortstack.org" . (:level . 1))
        ("~/Dropbox/org/code.org" . (:level . 1))
        ("~/Dropbox/org/blogs.org" . (:level . 1))))


;; mobile-org sync

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/mobile.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; from https://gist.github.com/3111823 ASYNC org mobile push...
;; Define a timer variable
(defvar org-mobile-push-timer nil)

;; Push to mobile when the idle timer runs out
(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))

;; After saving files, start an idle timer after which we are going to push
(add-hook 'after-save-hook
          (lambda ()
            (if (or (eq major-mode 'org-mode) (eq major-mode 'org-agenda-mode))
                (dolist (file (org-mobile-files-alist))
                  (if (string= (expand-file-name (car file)) (buffer-file-name))
                      (org-mobile-push-with-delay 10))))))

;; Run after midnight each day (or each morning upon wakeup?).
(run-at-time "00:01" 86400 '(lambda () (org-mobile-push-with-delay 1)))

;; Run 1 minute after launch, and once a day after that.
(run-at-time "1 min" 86400 '(lambda () (org-mobile-push-with-delay 1)))

;; watch index.org for changes, and then call org-mobile-pull
;; http://stackoverflow.com/questions/3456782/emacs-lisp-how-to-monitor-changes-of-a-file-directory
(defun install-monitor (file secs)
  (run-with-timer
   1 secs
   (lambda (f p)
     (unless (< p (second (time-since (elt (file-attributes f) 5))))
       (org-mobile-pull)))
   file secs))

(defvar monitor-timer (install-monitor (concat org-mobile-directory "/mobileorg.org") 30)
  "Check if file changed every 30 s.")


(provide 'org-setup)
