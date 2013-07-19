;;(add-to-list 'load-path (concat dotfiles-dir "others/emms/lisp"))
(add-to-list 'load-path (concat dotfiles-dir "emms")) ;; Evil hack. fix real vcersion
(require 'emms-setup)
(emms-all)
;; (autoload 'emms-all "emms-setup" "Start a GNU Emacs multimedia system session." t)
;; (autoload 'emms-default-players "emms-setup" "Start a GNU Emacs multimedia system session." t)
(emms-default-players)

(setq emms-player-mpg321-command-name "mpg123"
      emms-player-list '(emms-player-mpg321
			 emms-player-mplayer
			 emms-player-mplayer-playlist))
(setq cannot-suspend t)

(global-set-key "\M-\;" 'emms-previous)
(global-set-key "\M-\'" 'emms-next)
(global-set-key "\M-\[" 'emms-start)
(global-set-key "\M-\]" 'emms-stop)
(global-set-key "\M-\\" 'emms-random)
(global-set-key "\M-\?" 'emms-show)
;; emms
;; Your API Key is 5c7ea516f4a002371d4493bddab3777e
;; Your secret is 69562dd0a2a4d6f84b8a075322f662f4
