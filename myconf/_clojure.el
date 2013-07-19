;; clojure-mode
;; (add-to-list 'load-path (concat dotfiles-dir "/clojure-shit/clojure-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/clojure-shit/swank-clojure/src/emacs"))
;; (add-to-list 'load-path (concat dotfiles-dir "/clojure-shit/swank-clojure-1.1.0/"))
;;(add-to-list 'load-path (concat dotfiles-dir "clojure-shit/clojure-mode"))
(require 'clojure-mode)

;; swank-clojure

(setq swank-clojure-jar-path (concat dotfiles-dir "clojure-shit/clojure.jar")
      swank-clojure-extra-classpaths (list
				      (concat dotfiles-dir "clojure-shit/swank-clojure/src/main/clojure")
				      (concat dotfiles-dir "clojure-shit/clojure-contrib.jar")))
(load-file (concat dotfiles-dir "clojure-shit/swank-clojure-1.1.0/swank-clojure-autoloads.el"))
;;(require 'swank-clojure-autoload)

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path (concat dotfiles-dir "clojure-shit/slime"))
(require 'slime)
(slime-setup)

;; (add-to-list 'load-path (concat dotfiles-dir "slime/"))
;; (add-to-list 'load-path (concat dotfiles-dir "slime/contrib"))
;; (require 'slime)
;; (slime-setup)

;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
;; (if (file-exists-p "/usr/sbcl/run-sbcl.sh")
;;     (setq inferior-lisp-program "/usr/sbcl/run-sbcl.sh")
;;   (setq inferior-lisp-program "/usr/bin/sbcl")
;;   )

;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

