(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; tips
;; opening files via tramp/sudo
;; C-x C-f /sudo:raspy.local:/etc/fstab RET


(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


(ido-mode t)
(ido-ubiquitous t)




(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(require 'smex)
(smex-initialize)

(require 'auto-complete)
;;(require 'yasnippet)

(require 'inf-mongo)
(require 'powerline)
(require 'pallet)

(powerline-default-theme)


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

(require 'my-functions)
(require 'my-keybindings)

;; Customizations

(go-to-hell-bars)
(toggler embiggen nil t)


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
(add-hook 'find-file-hook 'delete-trailing-whitespace)
(add-hook 'find-file-hook 'untabify-all)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'untabify-all)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'objc-mode-hook 'objc-mode-customizations)

;; change backup location
(setq backup-directory-alist '(("." . "~/.emacs.d/.backups")))

;;; Remove M-h in magit-status
(add-hook 'magit-mode-hook (lambda ()
                             (define-key magit-mode-map (kbd "M-h") nil)))

;;; Use auto-fill mode when in markdown
(add-hook 'markdown-mode-hook 'auto-fill-mode)


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
;;  (set-face-background 'mode-line "#E6DB74")
;;  (set-face-background 'mode-line "#a6e22a")
;;  (set-face-foreground 'mode-line "#141411"))

;; use utf-8 for everything
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;(setq ansi-term-color-vector (vector "white" "red" "green" "yellow" "royal blue" "magenta" "cyan" "white"))
;;(setq ansi-term-color-vector [unspecified "white" "red" "green" "yellow" "royal blue" "white" "cyan" "white"])



(require-maybe 'my-local)
(require-maybe 'emux-session)
