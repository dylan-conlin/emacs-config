(require 'helm-projectile)
(require 'helm-cmd-t)

(defun my-helm-do-ag ()
  (interactive)
  (helm-do-ag (projectile-project-root)))

(defun helm-project-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (if (this-is-a-git-repo?)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm :sources '(helm-c-source-ls-git-status
			 helm-c-source-ls-git
			 helm-source-pp-bookmarks)
              :buffer "*project-search*"
              :prompt (projectile-prepend-project-name "pattern: ")))
    (helm-projectless-search)))

(defun helm-projectless-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources '(helm-source-buffers-list
		     helm-source-pp-bookmarks
                     helm-source-ido-virtual-buffers)
          :buffer "*project-search*"
          :prompt (projectile-prepend-project-name "pattern: "))))

(setq helm-adaptive-mode t)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)

(provide 'helm-setup)
