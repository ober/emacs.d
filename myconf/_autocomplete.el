(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/ac-dict"))
(ac-config-default)
(setq auto-save-default nil)
