(setq debug-on-error t)
(setq debug-init t)
(setq debug-on-quit t)
(setq stack-trace-on-error t)


(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(if (featurep 'aquamacs)
    (load-file "~/.emacs.d/others/aquamacs-package-install-el/aquamacs-package-install.el")
  (require 'package))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(add-to-list 'package-archives
'("melpa" . "http://melpa.milkbox.net/packages/") t)

;; missing babel xcscope websocket ein text-translator
(defvar my-packages '(
                      auto-complete
                      clojure-mode
                      color-theme
                      cygwin-mount
                      ecb
                      elnode
                      expand-region
                      feature-mode
                      flymake-jslint
                      flymake-ruby
                      geiser
                      gist
                      go-mode
                      google-this
                      google-translate
                      hackernews
                      inf-ruby
                      jabber
                      js-comint
                      js2-mode
                      magit
                      minimap
                      mldonkey
                      multi-term
                      multiple-cursors
                      mustache-mode
                      nrepl
                      org-blog
                      pivotal-tracker
                      rinari
                      robe
                      rsense
                      rspec-mode
                      ruby-block
                      ruby-compilation
                      ruby-end
                      ruby-mode
                      ruby-test-mode
                      ruby-tools
                      rvm
                      slime
                      slime-js
                      starter-kit
                      starter-kit-bindings
                      starter-kit-lisp
                      supergenpass
                      tabbar
                      twittering-mode
                      workgroups
                      yaml-mode
                      yari
                      yasnippet
                      znc))

(defvar no-aquamacs '(starter-kit-bindings starter-kit-lisp starter-kit yari))

(if (featurep 'aquamacs)
    (progn
      (defvar my-packages2 (loop for l in my-packages
            if (not (memq l no-aquamacs)) collect l))
      (message "We have Aquamacs"))
  (progn
    (defvar my-packages2 my-packages)
    (message "Not Aquamacs"))
  )

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path dotfiles-dir)


;; <bpalmer> [22:23:16] jaimef: (loop for l in list if (not (memq l
;;           stuff-to-remove)) collect l)


(if (y-or-n-p "Load Full Work Mode?")
    (setq full-work-mode t)
  (setq full-work-mode nil))


(load-file (concat dotfiles-dir "myconf/_secrets.el"))
;;(if (eq system-type 'ns) (load-file (concat dotfiles-dir "myconf/_mac.el")))
(load-file (concat dotfiles-dir "myconf/_bbdb.el"))

(load-file (concat dotfiles-dir "mailcap.elc")) ;; dumb hack to fix
;; package.el fuckage
(load-file (concat dotfiles-dir "myconf/_autocomplete.el"))
(load-file (concat dotfiles-dir "myconf/_blog.el"))
(load-file (concat dotfiles-dir "myconf/_browser.el"))
;;(load-file (concat dotfiles-dir "myconf/_campfire.el"))
;;(load-file (concat dotfiles-dir "myconf/_clojure.el"))
;;(load-file (concat dotfiles-dir "myconf/_colortheme.el"))
(load-file (concat dotfiles-dir "myconf/_conluence.el"))
(load-file (concat dotfiles-dir "myconf/_ecb.el"))

(load-file (concat dotfiles-dir "myconf/_erc.el"))
(load-file (concat dotfiles-dir "myconf/_gnuplot.el"))
;;(load-file (concat dotfiles-dir "myconf/_jabber.el")) ;; read in on_startup.el now
(load-file (concat dotfiles-dir "myconf/_jira.el"))
(load-file (concat dotfiles-dir "myconf/_js.el"))
(load-file (concat dotfiles-dir "myconf/_mail.el"))
(load-file (concat dotfiles-dir "myconf/_olds.el")) ;; because gnus sucks

(load-file (concat dotfiles-dir "myconf/_my_functions.el"))
(load-file (concat dotfiles-dir "myconf/_org.el"))
(load-file (concat dotfiles-dir "myconf/_ruby.el"))
(load-file (concat dotfiles-dir "myconf/_scheme.el"))
;;(load-file (concat dotfiles-dir "myconf/_slime.el"))
(load-file (concat dotfiles-dir "myconf/_skype.el"))
(load-file (concat dotfiles-dir "myconf/_ssh.el"))
;;(load-file (concat dotfiles-dir "myconf/_yassnippets.el"))
(load-file (concat dotfiles-dir "myconf/_zendesk_cal.el"))
(load-file (concat dotfiles-dir "myconf/_keys.el"))
;;(load-file (concat dotfiles-dir "myconf/_el_get.el"))
(load-file (concat dotfiles-dir "myconf/custom.el"))
(load-file (concat dotfiles-dir "myconf/_translate.el"))
(load-file (concat dotfiles-dir "myconf/_mobileorg.el"))
(load-file (concat dotfiles-dir "myconf/load_wl.el"))
;;(load-file (concat dotfiles-dir "myconf/_zone.el"))

(if (eq system-type 'windows-nt) (load-file (concat dotfiles-dir "myconf/_win.el")))
(if (eq system-type 'darwin) (load-file (concat dotfiles-dir "myconf/_mac.el")))

(load-file (concat dotfiles-dir "myconf/_emms.el"))
(load-file (concat dotfiles-dir "myconf/_misc.el"))
(setq custom-file (concat dotfiles-dir "myconf/custom.el"))

;;(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir nil ".*el$")))

(autoload 'relisp-start-slave "relisp" nil t)

(setq epa-file-select-keys t)

(require 'epa-file)
(epa-file-enable)

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
( if window-system (set-face-attribute 'default nil :font "Pragmata TT 10"))
(if (eq system-type 'ns)  (set-face-attribute 'default nil :font "Pragmata TT 14"))
;;(load-theme 'wombat t) ;; how it's done in 24

(load-file (concat dotfiles-dir "myconf/_startup.el"))
;;(zone-when-idle 60)
(winner-mode)
(put 'narrow-to-region 'disabled nil)
