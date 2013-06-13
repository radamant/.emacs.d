(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; tips
;; opening files via tramp/sudo
;; C-x C-f /sudo:raspy.local:/etc/fstab RET


(package-initialize)

(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(require 'smex)
(require 'auto-complete)
(require 'inf-mongo)
(require 'powerline)
(require 'pallet)

;;(require 'multi-term)
;;(setq multi-term-program "/bin/bash")

(require 'itail)
(require 'kill-ring-search)
(require 'ido-ubiquitous)

(require 'magit)
(require 'custom)

(require 'simp)

(simp-project-define
 '(:has (.git)
        :ignore (.git)))

(define-key magit-mode-map (kbd "Z") 'magit-quick-stash)

(mapc
 'require
 '(my-functions
   my-keybindings
   my-hooks
   my-initializers))

;; Hooks

;; load header files in objc-mode
(add-to-list 'magic-mode-alist
                `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>"
                                             magic-mode-regexp-match-limit t)))
                  . objc-mode))

;; Remove trailing whitespace
(setq require-final-newline 't)

;; change backup location
(setq backup-directory-alist '(("." . "~/.emacs.d/.backups")))


;; Auto mode list
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".md" . markdown-mode))

;; Make confirmations easier to type
(fset 'yes-or-no-p 'y-or-n-p)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)

(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  (set-face-background 'fringe "#383830")
  (set-face-foreground 'vertical-border "#141411"))

;; use utf-8 for everything
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)



(require-maybe 'my-local)
(require-maybe 'emux-session)
