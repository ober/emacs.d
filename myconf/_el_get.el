(add-to-list 'load-path (concat dotfiles-dir "others/el-get"))
;;(add-to-list 'load-path (concat dotfiles-dir "others/el-get/el-get"))
(require 'el-get)
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(el-get 'sync)
