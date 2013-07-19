(if (file-directory-p "c:/cygwin/bin")
    (add-to-list 'exec-path "c:/cygwin/bin")
  (add-to-list 'exec-path "c:/Users/ober/ccl-1.8-windowsx86/ccl/")
  )
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)
(setq tramp-default-method "scpx")
;;http://gregorygrubbs.com/emacs/10-tips-emacs-windows/
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(setq w3m-command "c:/cygwin/bin/w3m.exe")
(global-set-key "\C-xm" 'browse-url-default-windows-browser)
(setq geiser-racket-binary "c:\\Program Files\\Racket\\Racket.exe")
(setq geiser-guile-binary "c:\\cygwin\bin\guile.exe")
(defun set-transparency (alpha-level)
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level (if (< alpha-level 2)
                          (read-number "Opacity percentage: " 85)
                          alpha-level))
                     (myalpha (frame-parameter nil 'alpha)))
        (set-frame-parameter nil 'alpha alpha-level))
    (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

(setq doc-view-ghostscript-program "c:/cygwin/bin/gs.exe")
;; get clozure-cl at http://ccl.clozure.com/download.html
(setq inferior-lisp-program "c:/ccl-1.8-windowsx86/ccl/wx86cl64.exe")
(setq inferior-lisp-program "c:/cygwin/bin/clisp.exe")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq inferior-lisp-program "c:/sbcl/sbcl.exe")
(setq slime-net-coding-system 'utf-8-unix)
;;(slime-setup '(slime-fancy))
;;; for windows get http://vgoulet.act.ulaval.ca/en/emacs/windows/ !!!
;;; insanely great
;; (setq imap-ssl-program-binary
;;   "c:/cygwin/bin/openssl.exe")
;; (setq imap-ssl-program-arguments
;;   "s_client -quiet -ssl3 -connect %s:%p")
;; (setq imap-ssl-program
;;   (concat imap-ssl-program-binary
;;       " "
;;      imap-ssl-program-arguments))

;; (setq gnus-secondary-select-methods
;; '((nnimap "gmail"
;;        (nnimap-address "imap.gmail.com")
;;        (nnimap-server-port 993)
;;        (nnimap-stream ssl)
;;        (nnimap-authinfo-file
;;       "~/.authinfo"))))

;; copy fucking spaced named files suck balls.
;; copy c:\Program Fucking Files (x86)\GNU Emacs 24.2\ to /c/emacs-24.2
;;C:\cygwin\bin\bash.exe --login -c "env HOME=\"`cygpath %APPDATA%'`\"  /c/emacs-24.2/bin/runemacs.exe


;; (defun cygwin-shell ()
;;   "Run cygwin bash in shell mode."
;;   (interactive)
;;   (let ((explicit-shell-file-name "C:/cygwin/bin/bash.exe")
;;     (call-interactively 'shell)))
(require 'setup-cygwin)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "c:/cygwin/usr/sbin/msmtp.exe")
;;(setq tls-program '("c:/cygwin/bin/openssl.exe s_client -connect %h:%p -no_ssl2 -ign_eof"))
(setq tls-prgram '( "/bin/openssl.exe s_client -connect %h:%p -no_ssl2 -ign_eof"))
;;(setq tls-program
;;(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; email stuff
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "c:/cygwin/usr/sbin/msmtp.exe")
(setq message-sendmail-extra-arguments '("-a" "ale"))

(load-library "nnimap")
(setq imap-ssl-program "c:/cygwin/bin/openssl.exe s_client -ssl3 -quiet -connect %s:%p")

;;(setq gnus-select-method '(nntp "news2.open-news-network.org"))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnimap-authinfo-file "~/.authinfo")
                      (nnimap-stream ssl)))

;; (add-to-list 'gnus-secondary-select-methods
;;              '(nntp "news.gmane.org"))
