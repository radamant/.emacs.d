(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; tips
;; opening files via tramp/sudo
;; C-x C-f /sudo:raspy.local:/etc/fstab RET


(package-initialize)

(mapc
 'require
 '(
   smex
   auto-complete
   inf-mongo
   powerline
   pallet
   itail
   kill-ring-search
   ido
   ido-ubiquitous
   magit
   custom
   simp
   my-functions
   my-keybindings
   my-hooks
   my-settings
   my-initializers))

(simp-project-define
 '(:has (.git)
        :ignore (.git)))


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
(dired "~/.emacs.d")
