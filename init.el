(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'cask "~/.cask/cask.el")


(cask-initialize)
(mapc
 'require
 '(
   pallet
   smex
   auto-complete
   inf-mongo
   powerline
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
;;(dired "~/.emacs.d")
