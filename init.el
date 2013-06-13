(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; tips
;; opening files via tramp/sudo
;; C-x C-f /sudo:raspy.local:/etc/fstab RET

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
   my-add-to-lists
   my-project-definitions
   my-settings
   my-initializers))

(require-maybe 'my-local)
(require-maybe 'emux-session)
(dired "~/.emacs.d")
