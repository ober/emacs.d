(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(setq org-log-done t)
(setq org-agenda-files (list "~/.emacs.d/org/work.org"
                             "~/.emacs.d/org/fun.org"
                             "~/.org-jira//OP.org"
                             "~/.org-jira/SEARCH.org"
                             "~/.emacs.d/org/home.org"))
(setq org-agenda-include-diary t)
(defun gtd ()
  (interactive)
  (find-file "~/.emacs.d/org/mygtd.org")

  )
