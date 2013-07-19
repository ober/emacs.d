 (load (expand-file-name "/usr/home/jaimef/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/bin/sbcl --noinform --dynamic-space-size 128")
