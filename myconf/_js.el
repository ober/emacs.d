;; JS shit
(add-to-list 'load-path (concat dotfiles-dir "lintnode/"))
;;(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location (concat dotfiles-dir "lintnode/"))
;; JSLint can be... opinionated
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we fpirst open a js file and start checking
(add-hook 'js-mode-hook
          (lambda ()
            (lintnode-hook)))

(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")


(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                                                 (replace-regexp-in-string ".*1G.*3G" "&GT;" output))))))

(defvar url-http-end-of-headers)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
