;;(require 'geiser-install)
;; not really scheme, but lisp related
(add-to-list 'load-path "~/.emacs.d/others/newlisp-mode/")
(load-file "~/.emacs.d/others/newlisp-mode/newlisp.el")
(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))
