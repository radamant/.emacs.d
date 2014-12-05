(setq
 custom-file (expand-file-name "~/.emacs.d/custom.el")
 require-final-newline 't
 multi-term-program "/bin/zsh"
 inhibit-startup-message t
 org-agenda-files (list "~/.org/home.org" "~/.org/work.org"))


(fset 'yes-or-no-p 'y-or-n-p)

;; mac specific settings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta))

;; use utf-8 for everything
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(load custom-file)
;; backup autosave etc
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(provide 'my-settings)
