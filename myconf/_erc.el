(setq erc-auto-reconnect nil)
(when (and (eq major-mode 'erc-mode)
           (not (null buffer-file-name))))
