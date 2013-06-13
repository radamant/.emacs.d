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
(require 'itail)
(require 'kill-ring-search)
(require 'ido)
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
   my-settings
   my-initializers))

;; load header files in objc-mode
(add-to-list 'magic-mode-alist
                `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>"
                                             magic-mode-regexp-match-limit t)))
                  . objc-mode))

;; Auto mode list
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".md" . markdown-mode))

(set-face-background 'fringe "#383830")
(set-face-foreground 'vertical-border "#141411")

(require-maybe 'my-local)
(require-maybe 'emux-session)
