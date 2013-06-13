(let
    ((rails-ignore '(tmp
                     coverage
                     log
                     vendor
                     .git
                     .css
                     private
                     public
                     .jhw-cache)))
  (simp-project-define
   '(:has (.git)
          :ignore (.git)))

  (simp-project-define
   `(:type rails
           :has (config.ru app/views app/models app/controllers)
           :ignore ,rails-ignore))

  (simp-project-define
   '(:type node
           :has (node_modules)))
  (provide 'my-project-definitions))
