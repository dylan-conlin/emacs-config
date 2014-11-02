(require 'helm-cmd-t)

(defun my-helm-do-ag ()
  (interactive)
  (helm-do-ag (projectile-project-root)))

(defun helm-project-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (if (this-is-a-git-repo?)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm :sources '(helm-source-projectile-buffers-list
			 helm-source-bookmarks
                         helm-source-projectile-files-list
			 helm-source-projectile-directories-list)
              :buffer "*project-search*"
              :prompt (projectile-prepend-project-name "pattern: ")))
    (helm-projectless-search)))

(defun helm-projectless-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources '(helm-source-buffers-list
		     helm-source-bookmarks
                     helm-source-ido-virtual-buffers)
          :buffer "*project-search*"
          :prompt (projectile-prepend-project-name "pattern: "))))

(helm-adaptive-mode t)
(provide 'helm-setup)
