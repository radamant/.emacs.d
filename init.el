(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(mapc
 'require
 '(
   smex
   monokai-theme
   solarized-theme
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

(require-maybe 'emux-session)
(require-maybe 'my-local)

(emux-session-define-template
 emacs-config
 (emux-session-set-default-directory "~/.emacs.d/")
 (emux-session-set-default-directory "~/.emacs.d/")
 (emux-screen-create '(:name "git") "git" "git status")
 (find-file "init.el")
 (split-window-vertically)
 (other-window 1)
 (find-file "my/my-local.el"))
