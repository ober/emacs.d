
(defun start-identica ()
  (interactive)
  (load-file (concat dotfiles-dir "myconf/secrets.el"))
  (require 'secrets)
  )

(if full-work-mode
    (progn
      (start-identica)
      )
  (progn
    (setq identica-zendesk-gmail-password "blahblah" )
    (setq identica-jabber-personal "blahblah" )
    )
  )
