(require 'auto-complete-config)

(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/configs/dict/")
(auto-complete-mode t)
(setq ac-use-fuzzy t)
(setq ac-use-menu-map t)

(provide 'autocomplete-setup)
