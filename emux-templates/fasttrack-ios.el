(emux-session-set-default-directory "~/projects/fasttrack-upshot/")
(emux-screen-create '(:name "control") "control" "ls")
(magit-status (emux-session-get :default-directory))
