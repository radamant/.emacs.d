(emux-session-set-default-directory "~/projects/wishfulthingking-2013/")
(emux-screen-create '(:name "control") "control" "ls")
(magit-status (emux-session-get :default-directory))
