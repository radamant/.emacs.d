(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(when-available 'smex
 (global-set-key  (kbd "M-x") 'smex))

(define-key magit-mode-map (kbd "Z") 'magit-quick-stash)

(define-key key-translation-map "\C-j" "\C-x")
(global-set-key (kbd "C-S-p") 'move-text-up)
(global-set-key (kbd "C-S-n") 'move-text-down)

(global-set-key (kbd "M-l")  'next-in-frame-window)
(global-set-key (kbd "M-h") 'previous-in-frame-window)
(global-set-key (kbd "C-S-f") 'unbury-buffer)
(global-set-key (kbd "C-S-b") 'bury-buffer)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-j c") 'emux-term)
(global-set-key (kbd "M-j P") 'emux-session-load-template)
(global-set-key (kbd "M-j C-s") 'emux-session-switch)
(global-set-key (kbd "M-j g") 'magit-status)

(global-set-key (kbd "M-j s") 'simp-project-rgrep)
(global-set-key (kbd "M-j S") 'simp-project-rgrep-dwim)
(global-set-key (kbd "M-j f") 'simp-project-find-file)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "C-c o") 'ff-get-other-file)
(global-set-key (kbd "C-c f") 'ff-find-other-file)

(provide 'my-keybindings)
