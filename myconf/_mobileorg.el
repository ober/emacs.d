(defun my-org-convert-incoming-items ()
  (interactive)
  (with-current-buffer (find-file-noselect org-mobile-inbox-for-pull)
    (goto-char (point-min))
    (while (re-search-forward "^\\* " nil t)
      (goto-char (match-beginning 0))
      (insert ?*)
      (forward-char 2)
      (insert "TODO ")
      (goto-char (line-beginning-position))
      (forward-line)
      (insert
       (format
        " SCHEDULED: %s
:PROPERTIES:
:ID: %s :END:
"
        (with-temp-buffer (org-insert-time-stamp (current-time)))
        (shell-command-to-string "uuidgen"))))
    (let ((tasks (buffer-string)))
      (erase-buffer)
      (save-buffer)
      (kill-buffer (current-buffer))
      (with-current-buffer (find-file-noselect "mobileorg.org")
        (save-excursion
          (goto-char (point-min))
          (search-forward "* CEG")
          (goto-char (match-beginning 0))
          (insert tasks))))))

(add-hook 'org-mobile-post-pull-hook 'my-org-convert-incoming-items)

;; Set to the location of your Org files on your local system
(setq org-directory "~/.emacs.d/org")
;; Set to the name of the file where new notes will be stored
;; Set to <your Dropbox root directory>/MobileOrg.
