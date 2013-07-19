;; campfire
(load-file (concat dotfiles-dir "others/campfire-el/campfire.el"))
(defvar campfire-domains
      '(((domain . "tungnguyen.campfirenow.com")
         (token . "155b327de278f036cf60b4d181eb0e1e536e30d9")
         (ssl . t))
        ))
(setq campfire-room-name "465862")
(add-to-list 'load-path (concat dotfiles-dir "others/jezebel/"))
(load-file (concat dotfiles-dir "others/jezebel/jezebel.el"))
