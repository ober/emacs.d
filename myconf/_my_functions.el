(defun my-ansi-term () (interactive)(ansi-term "/bin/zsh"))

(global-set-key "\C-t" 'my-ansi-term)
;;(defun my-getmail () (interactive)(shell-command "/stick/gm &")) (global-set-key [(f10)] 'my-getmail)
;;(defun my-getdb-entry () (interactive)(shell-command "~/getdbentry &")) (global-set-key [(f7)] 'my-getdb-entry)


(defun random-color-theme
  ()
  (interactive)
  (let
      ((chosen-theme
        (nth
         (random
          (length
           (mapcar 'symbol-name
                   (custom-available-themes))))
         (custom-available-themes))))
    (message "Theme: %s" chosen-theme)
    (apply 'disable-theme custom-enabled-themes)
    (load-theme chosen-theme t nil)))

(defun show-me-the-colors ()  (interactive)
  (loop do (random-color-theme) (sit-for 3)))

(defun show-me-the-colors ()  (interactive) (loop do (random-color-theme) (sit-for 3)))
(setq color-theme-is-cumulative nil)

(defun reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-update)
  (erc-modified-channels-display))

(defun occur-word-at-point () "open an *Occur* buffer for
       the word under point" (interactive) (occur-1 (concat "\\b"
                                                            (word-at-point) "\\b") 0 (list (current-buffer))))
(defun my-skype ()
  (interactive)
  (add-to-list 'load-path (concat dotfiles-dir "emacs-skype"))
  (require 'skype)
  (setq skype--my-user-handle "jaimefournier")
  (global-set-key (kbd "M-9") 'skype--anything-command))

(defun last-fm () (interactive) (emms-lastfm-client-user-authorization) (browse-url-generic (format "http://www.last.fm/api/auth/?api_key=%s&token=%s" emms-lastfm-client-api-key emms-lastfm-client-token)))
;;(global-set-key [(f8)] 'last-fm)

(defun byte-compile-user-init-file ()
  (let ((byte-compile-warnings '(unresolved)))
    ;; in case compilation fails, don't leave the old .elc around:
    (when (file-exists-p (concat user-init-file ".elc"))
      (delete-file (concat user-init-file ".elc")))
    (byte-compile-file user-init-file)
    (message "%s compiled" user-init-file)))

(defun my-emacs-lisp-mode-hook ()
  (when (equal buffer-file-name user-init-file)
    (add-hook 'after-save-hook 'byte-compile-user-init-file t t)))

(defun myput () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command (format "~/streams/streams push \"%s\"" buffer-file-name)))
(global-set-key [(f7)]  'myput)

(defun myget () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command (format "~/streams/streams pull \"%s\"" buffer-file-name) (revert-buffer t t nil)) (nxml-mode))
(global-set-key [(f8)]  'myget)

(defun my-fetch-all () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command "~/streams/streams fetch-all &" "confluence-fetch-all"))
(defun my-list-tickets () (interactive) (shell-command (format "ATLASSIAN_PASSWORD=\"%s\" /home/jaimef/streams/streams list_tickets &" identica-jira-password)))

;;(defun my-play-endlessly () (interactive) (loop do (unless busy (setq busy t) (emms-lastfm-client-play-recommended) (setq busy nil))))
(defun my-play-endlessly () (interactive) (run-with-idle-timer 10 't (my-mood-music)))

(defun mytidy ()
  "Tidies the HTML content in the buffer using `tidy'"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (point-min)
   (point-max)
   ;; command and parameters
   "tidy --input-xml true -i -w 120 -q"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Tidy Error Buffer*"
   ;; show error buffer?
   t)
  (nxml-mode))


(defun mylint ()
  "Tidies the HTML content in the buffer using `xmllint'"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (point-min)
   (point-max)
   ;; command and parameters
   "xmllint --format --recover --html -"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Xmllnt Error Buffer*"
   ;; show error buffer?
   nil)
  (nxhtml-mode)
  (indent-region (point-min) (point-max) nil))

(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0)))
  )

(defun my-mood-music () (interactive) (let ((default-directory "~/sr")) (emms-lastfm-client-play-similar-artists in-the-mood-for)))



(defun gco () (interactive)
  (setq default-directory (read-from-minibuffer "Directory? "))
  (shell-command (format "cd %s && git clone %s &" default-directory (read-from-minibuffer "Git repo url? "))))

(defun ggrep () (interactive)
  (setq default-directory (read-from-minibuffer "Git Directory? "))
  (async-shell-command (format "cd %s && git grep -Hn %s" default-directory (read-from-minibuffer "Search pattern: ")) "*git-grep*" "*git-grep-error*") (switch-to-buffer "*git-grep*") (grep-mode))

(defun rotate-windows ()
  "Rotate your windows" (interactive) (cond ((not (> (count-windows) 1)) (message "You can't rotate a single window!"))
                                            (t
                                             (setq i 1)
                                             (setq numWindows (count-windows))
                                             (while  (< i numWindows)
                                               (let* (
                                                      (w1 (elt (window-list) i))
                                                      (w2 (elt (window-list) (+ (% i numWindows) 1)))
                                                      (b1 (window-buffer w1))
                                                      (b2 (window-buffer w2))
                                                      (s1 (window-start w1))
                                                      (s2 (window-start w2))
                                                      )
                                                 (set-window-buffer w1  b2)
                                                 (set-window-buffer w2 b1)
                                                 (set-window-start w1 s2)
                                                 (set-window-start w2 s1)
                                                 (setq i (1+ i)))))))
(global-set-key (kbd "C-c p") 'rotate-windows)


(defun imf (x) (interactive "sIn The Mood For: ")
  (setq in-the-mood-for x ))


;;  (async-shell-command (format "cd %s && git grep -Hn %s" default-directory (read-from-minibuffer "Search pattern: ")) "*git-grep*" "*git-grep-error*") (switch-to-buffer "*git-grep*") (grep-mode))

(defun compile-go () (interactive) (async-shell-command (format "go run %s" (buffer-file-name (current-buffer)))))
(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-g") 'compile-go)))
