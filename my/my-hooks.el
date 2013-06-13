(add-hook 'find-file-hook 'delete-trailing-whitespace)
(add-hook 'find-file-hook 'untabify-all)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'untabify-all)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'objc-mode-hook 'objc-mode-customizations)

;;; Remove M-h in magit-status
(add-hook 'magit-mode-hook (lambda ()
                             (define-key magit-mode-map (kbd "M-h") nil)))
;;; Use auto-fill mode when in markdown
(add-hook 'markdown-mode-hook 'auto-fill-mode)

(provide 'my-hooks)
