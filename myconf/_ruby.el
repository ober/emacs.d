(setq ri-ruby-script (expand-file-name "~/.emacs.d/el-get/ri-emacs/ri-emacs.rb"))
(local-set-key [control] 'ri-ruby-complete-symbol)
;;local-set-key [f13] 'ri-ruby-show-args)

'(font-lock-keyword-face ((t (:bold t :foreground "CornflowerBlue"))))
(require 'ruby-block)
(ruby-block-mode t)

(defun ruby-custom-setup ()
  (local-set-key "\C-x \d`" 'flymake-goto-next-error)
  (add-to-list 'hs-special-modes-alist
	       '(ruby-mode
		 "\\(def\\|do\\)"
		 "end"
		 "#"
		 (lambda (arg) (ruby-end-of-block))
		 nil))  (hs-minor-mode t))

(add-hook 'ruby-mode-hook 'ruby-custom-setup)
(autoload 'ruby-eval "relisp" nil t)
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
(require 'rvm)
;;(local-set-key [f1] 'yari)

(require 'rsense)
;; (add-to-list 'load-path (concat dotfiles-dir "/yari.el"))
;; (require 'yari)
(load-file (concat dotfiles-dir "others/rcodetools.el"))
(setq rspec-use-rvm t)

(require 'flymake)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-w -c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '(".+\\.erb$$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()
	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))))

;; (autoload 'inf-ruby-keys "inf-ruby"
;;  "Set local key defs for inf-ruby in ruby-mode")
;;(inf-ruby-keys)
;;  (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;; (local-set-key 'f2 'ri-ruby-show-args)
;;(add-to-list 'which-func-modes 'ruby-mode)

;;(rvm-use-default)

;;(add-to-list 'which-func-modes 'ruby-mode)
;; (add-to-list 'load-path (concat dotfiles-dir "/cucumber"))
;;  (local-set-key 'f1 'ri)
;; (require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;;(folding-add-to-marks-list 'ruby-mode "#{{{" "#}}}" nil t)


(defun ruby-mode-keybindings ()
  (local-set-key (kbd  "C-x `") 'flymake-goto-next-error)
;;  (local-set-key (kbd "f1") 'ri)
  (local-set-key (kbd "C-c C-z") 'run-ruby))
(add-hook 'ruby-mode-hook 'ruby-mode-keybindings)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
