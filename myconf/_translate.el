(load-file "~/.emacs.d/elpa/google-translate-0.3.2/google-translate.el")

(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
