(require 'helm-config)
(require 'helm-projectile)
(require 'helm-cmd-t)
(require 'helm-ls-git)
(require 'helm-bind-key)

(defun my-helm-do-ag ()
  (interactive)
  (helm-do-ag (my-git-root)))

(defun helm-project-search ()
  "Use projectile with Helm instead of ido."
  (interactive)
  ;; (unless (and helm-source-ls-git-status
  ;;              helm-source-ls-git)
  ;;   (setq helm-source-ls-git-status
  ;;         (helm-make-source "Git status" 'helm-ls-git-status-source
  ;;           :fuzzy-match helm-ls-git-fuzzy-match)
  ;;         helm-source-ls-git))
  (if (this-is-a-git-repo?)
      (let ((helm-ff-transformer-show-only-basename nil))
        (helm :sources '(
			 helm-source-projectile-buffers-list
			 ;; helm-source-ls-git-status
			 helm-source-projectile-files-list
			 helm-source-bookmarks)
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
		     helm-source-bookmarks)
		     :buffer "*project(less)-search*"
		     :prompt (projectile-prepend-project-name "pattern: "))))


(setq helm-adaptive-mode t)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)

(provide 'helm-setup)
