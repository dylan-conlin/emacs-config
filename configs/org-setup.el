(require 'org)
(require 'org-install)
(require 'org-crypt)
(setq org-default-notes-file (expand-file-name "~/drive/org/notes.org"))
(setq org-directory "~/drive/org")

(setq org-agenda-files (quote
                        ("~/drive/org/todo.org"
                         "~/drive/org/notes.org")))
			 
(setq org-use-fast-todo-selection t)

(setq org-capture-templates
      '(
        ("c" "Code" entry (file+headline "~/drive/org/code.org" "Code") "* %^{title} %^g \n %? \n%U")
        ("o" "Contacts" entry (file "~/drive/org/contacts.org") "* %(org-contacts-template-name)\n:PROPERTIES:\n%(org-contacts-template-email)\n:END:")        
        ("e" "Email" entry (file+headline "~/drive/org/emails.org" "Emails") "* %^{title} %^g \n %? \n%U")
        ("n" "Note" entry (file+headline "~/drive/org/notes.org" "Notes") "* %^{title} %^g \n %? \n%U")
        ("s" "Shortstack" entry (file+headline "~/drive/org/shortstack.org" "Shortstack") "* %^{title} %^g \n %? \n%U")
        ("t" "Todo" entry (file+headline "~/drive/org/todo.org" "Tasks") "* TODO %^{title} %^g \n %? \n%U")
        ))


(setq org-refile-targets
      '(
        ("~/drive/org/notes.org" . (:level . 1))
        ("~/drive/org/todo.org" . (:level . 1))
        ("~/drive/org/shortstack.org" . (:level . 1))
        ("~/drive/org/code.org" . (:level . 1))
        ("~/drive/org/blogs.org" . (:level . 1))))

(setq org-log-done t)
(setq org-startup-indented t)
(setq org-hide-leading-starts t)

;; mobile-org sync

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull (s-concat org-directory "/flagged.org"))

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")



(provide 'org-setup)
