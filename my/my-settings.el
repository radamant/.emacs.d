(setq
 custom-file (expand-file-name "~/.emacs.d/custom.el")
 require-final-newline 't
 backup-directory-alist '(("." . "~/.emacs.d/.backups"))
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

(provide 'my-settings)
