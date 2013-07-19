(if full-work-mode
    (progn
      (znc-erc 'home)
      (load-file (concat dotfiles-dir "myconf/_jabber.el"))
      (jabber-connect-all)))
