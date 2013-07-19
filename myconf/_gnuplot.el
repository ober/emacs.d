;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
(setq load-path (append (list (concat dotfiles-dir "gnuplot-mode")) load-path))
(global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------
(local-set-key "\M-\C-g" 'org-plot/gnuplot)
(add-to-list 'load-path (concat dotfiles-dir "/geiser/elisp"))
