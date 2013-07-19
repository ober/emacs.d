;;(setq load-path (append (list (expand-file-name "~/.emacs.d/icalendar")) load-path))
(require 'icalendar)

(setq load-path (append load-path (list (expand-file-name "~/.emacs.d/others/"))))

(require 'google-calendar)

(setq google-calendar-user "GOOGLE USER")
(setq google-calendar-code-directory "~/.emacs.d/emacs-google-calendar/code")
(setq google-calendar-directory "~/tmp")
(setq google-calendar-url google-calendar)
(setq google-calendar-auto-update t)
