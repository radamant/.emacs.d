(add-hook 'find-file-hook 'delete-trailing-whitespace)
(add-hook 'find-file-hook (lambda () (untabify-all '("project.pbxproj"))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook (lambda () (untabify-all '("project.pbxproj"))))
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'objc-mode-hook 'objc-mode-customizations)

;;; Remove M-h in various modes
(add-hook 'magit-mode-hook (lambda ()
                             (define-key magit-mode-map (kbd "M-h") nil)))
(add-hook 'org-mode-hook (lambda ()
                      (define-key org-mode-map (kbd "M-h") nil)))

;;; Remove M-j in various modes

(add-hook 'objc-mode-hook (lambda ()
                      (define-key objc-mode-map (kbd "M-j") nil)))

(add-hook 'c-mode-hook (lambda ()
                      (define-key objc-mode-map (kbd "M-j") nil)))

(add-hook 'c++-mode-hook (lambda ()
                      (define-key objc-mode-map (kbd "M-j") nil)))


;;; Use auto-fill mode when in markdown
(add-hook 'markdown-mode-hook 'auto-fill-mode)

(provide 'my-hooks)
