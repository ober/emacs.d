(defun rcy-browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (let ((url
	 (if (aref (url-generic-parse-url url) 0)
	     url
	   (concat "http://" url))))
    (start-process (concat "open " url) nil "open" url)))
(setq browse-url-browser-function 'rcy-browse-url-default-macosx-browser)

(if (file-directory-p "/usr/local/bin")
    (add-to-list 'exec-path "/usr/local/bin"))

(global-set-key "\C-xm" 'browse-url-default-macosx-browser)


(setq browse-url-generic-program 'browse-url-generic browse-url-default-macosx-browser)
(setq browse-url-browser-function 'browse-url-generic browse-url-default-macosx-browser)
(setq inferior-lisp-program "/usr/local/bin/sbcl")


(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'meta)
(setq ring-bell-function 'ignore)

;; (defun browse-url-default-macosx-browser (url &optional new-window)
;;   (interactive (browse-url-interactive-arg "URL: "))
;;   (if (and new-window (>= emacs-major-version 23))
;;       (ns-do-applescript
;;        (format (concat "tell application \"Safari\" to make document with properties {URL:\"%s\"}\n"
;; 		       "tell application \"Safari\" to activate") url))
;;     (start-process (concat "open " url) nil "open" url)))


(setq browse-url-generic-program "open")
