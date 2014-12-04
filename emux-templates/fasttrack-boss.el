(emux-session-set-default-directory "~/projects/fasttrack-boss/")
(emux-screen-create '(:name "control") "control" "ls")
(emux-screen-create '(:name "server") "server" "bundle exec rails s")
(emux-screen-create '(:name "guard") "guard" "bundle exec guard")
(emux-screen-create '(:name "console") "console" "bundle exec rails c")
(emux-screen-create '(:name "worker") "worker" "QUEUES=* bundle exec rake resque:work")

(magit-status (emux-session-get :default-directory))
