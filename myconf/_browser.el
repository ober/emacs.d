(add-to-list 'load-path (concat dotfiles-dir "others/emacs-w3m"))
(require 'w3m)
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;;(setq browse-url-browser-function 'xwidget-webkit-browse-url)
;;(setq browse-url-browser-function 'xwidget-webkit-browse-url)
(setq browse-url-browser-function 'w3m-browse-url)
;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
