(emux-session-set-default-directory "~/projects/sc-downloader/")
(emux-screen-create '(:name "control") "control" "ls")
(magit-status (emux-session-get :default-directory))
