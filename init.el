(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
(defmacro require-maybe (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file 'noerror))

(defmacro when-available (func foo)
  "*Do something if FUNCTION is available."
  `(when (fboundp ,func) ,foo))

(require 'my-keybindings)
;; tips
;; opening files via tramp/sudo
;; C-x C-f /sudo:raspy.local:/etc/fstab RET


(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


(ido-mode t)
(ido-ubiquitous t)

(defun next-in-frame-window ()
  (interactive)
  (select-window (next-window)))

(defun previous-in-frame-window ()
  (interactive)
  (select-window (previous-window)))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(defun my-flowdock ()
  (interactive)
  (erc-tls :server "irc.flowdock.com" :port 6697
           :nick "emacs" :full-name "emacs")
  (setq email (read-input "email:"))
  (setq password (read-passwd "password:"))
  (erc-cmd-AMSG (concat "/msg NickServ identify" email " " password)))

(go-to-hell-bars)

;; from http://emacsblog.org/2009/05/18/copying-lines-not-killing/
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (save-excursion
    (beginning-of-line)
    (toggle-read-only 1)
    (kill-line arg)
    (toggle-read-only 0)))

(defun dont-kill-emacs () ;; why would i close it?
  (interactive)
  (error (substitute-command-keys "i can never be killed.")))
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(require 'smex)
(smex-initialize)

(require 'auto-complete)
;;(require 'yasnippet)

(require 'inf-mongo)
(require 'powerline)
(require 'pallet)
(powerline-default-theme)

(defmacro toggler (toggler-name &optional fn full)
  (let ((name
         (intern
          (mapconcat
           'symbol-name
           `(,toggler-name toggler)
           "-"))))
    `(defun ,name ()
       (interactive)
       (message (format "%s %s" ',toggler-name "toggled"))
       (if (and (boundp ',name) (car ,name))
           (progn
             (set-window-configuration (cadr ,name))
             (setq ,name '(nil nil)))
         (progn
           (setq ,name `(t ,(current-window-configuration)))
           (and ,full (delete-other-windows))
           (and ,fn (funcall ,fn)))))))

(toggler embiggen nil t)
;;(require 'multi-term)
;;(setq multi-term-program "/bin/bash")


(defun rename-current-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " default-directory filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(require 'itail)
(require 'kill-ring-search)
(require 'ido-ubiquitous)

(require 'magit)
(require 'custom)

(require 'simp)

(simp-project-define
 '(:has (.git)
        :ignore (.git)))

(defun magit-stage-all (&optional also-untracked-p)
  "Add all remaining changes in tracked files to staging area.
With prefix argument, add remaining untracked files as well.
\('git add -u .' or 'git add .', respectively)."
  (interactive "P")
  (if also-untracked-p
      (magit-run-git "add" ".")
    (magit-run-git "add" "-A" ".")))

(defun magit-tracking-name-unfucked-with (remote branch)
  branch)

(defun magit-quick-stash ()
  "Immediately stash with mesage

WIP on branchname: short-sha commit-message"
  (interactive)
  (magit-stash ""))

(define-key magit-mode-map (kbd "Z") 'magit-quick-stash)



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


;; --- Obj-C switch between header and source ---

(defun objc-in-header-file ()
  (let* ((filename (buffer-file-name))
         (extension (car (last (split-string filename "\\.")))))
    (string= "h" extension)))

(defun objc-jump-to-extension (extension)
  (let* ((filename (buffer-file-name))
         (file-components (append (butlast (split-string filename
                                                         "\\."))
                                  (list extension))))
    (find-file (mapconcat 'identity file-components "."))))

;;; Assumes that Header and Source file are in same directory
(defun objc-jump-between-header-source ()
  (interactive)
  (if (objc-in-header-file)
      (objc-jump-to-extension "m")
    (objc-jump-to-extension "h")))

(defun objc-mode-customizations ()
  (define-key objc-mode-map (kbd "C-c h") 'objc-jump-between-header-source)
  (c-set-offset 'arglist-cont-nonempty 0))

(defun untabify-all ()
  (interactive)
  (untabify (point-min) (point-max)))


(require-maybe 'my-local)
(require-maybe 'emux-session)
