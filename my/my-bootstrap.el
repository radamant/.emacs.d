; If pallet doesn't exist, bootstrap this machine (or not)
(condition-case nil (require 'pallet)
    (error
     (when (yes-or-no-p "Pallet does not exist, run bootstrap?")

       (package-initialize)
       (define-key key-translation-map "\C-j" "\C-x")
       (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
       (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
       (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
       ;;(package-list-packages)
       (package-refresh-contents)
       (package-install 'pallet)
       (require 'pallet)
       (pallet-install)
       (load-file "~/.emacs.d/init.el"))))

(provide 'my-bootstrap)
