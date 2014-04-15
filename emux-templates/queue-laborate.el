(emux-session-set-default-directory "~/projects/queue-laborate/")
(emux-screen-create '(:name "queue-laborate") "server" "npm start")
(emux-term-hsplit "test" "npm test")
(magit-status (emux-session-get :default-directory))
