(require 'helm-projectile)
(require 'helm-cmd-t)

(defun my-helm-do-ag ()
  (interactive)
  (helm-do-ag (projectile-project-root)))

(defun helm-project-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (unless helm-source-ls-git-status
    (setq helm-source-ls-git-status
  	  (helm-make-source "Status" 'helm-source-ls-git-status)))
  (if (this-is-a-git-repo?)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm :sources '(helm-source-projectile-buffers-list
			 helm-source-ls-git-status
			 helm-source-projectile-files-list
			 helm-source-pp-bookmarks)
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
		     helm-source-pp-bookmarks)
		     :buffer "*project(less)-search*"
		     :prompt (projectile-prepend-project-name "pattern: "))))


(setq helm-adaptive-mode t)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)

(provide 'helm-setup)
