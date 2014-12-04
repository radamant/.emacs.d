(emux-session-set-default-directory "~/projects/advomobo/")
(emux-screen-create '(:name "control") "control" "ls")
(magit-status (emux-session-get :default-directory))
