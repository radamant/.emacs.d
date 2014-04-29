(defmacro require-maybe (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file 'noerror))

(defmacro when-available (func foo)
  "*Do something if FUNCTION is available."
  `(when (fboundp ,func) ,foo))

(defun next-in-frame-window ()
  (interactive)
  (select-window (next-window)))

(defun previous-in-frame-window ()
  (interactive)
  (select-window (previous-window)))

(defun go-to-hell-bars ()
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(defun my-flowdock ()
  (interactive)
  (erc-tls :server "irc.flowdock.com" :port 6697
           :nick "emacs" :full-name "emacs")
  (setq email (read-input "email:"))
  (setq password (read-passwd "password:"))
  (erc-cmd-AMSG (concat "/msg NickServ identify" email " " password)))

;; from http://emacsblog.org/2009/05/18/copying-lines-not-killing/
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (save-excursion
    (beginning-of-line)
    (toggle-read-only 1)
    (kill-line arg)
    (toggle-read-only 0)))

(defun dont-kill-emacs () ;; why would i close it?
  (interactive)
  (error (substitute-command-keys "i can never be killed.")))

(defun rename-current-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " default-directory filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun magit-stage-all (&optional also-untracked-p)
  "Add all remaining changes in tracked files to staging area.
With prefix argument, add remaining untracked files as well.
\('git add -u .' or 'git add .', respectively)."
  (interactive "P")
  (if also-untracked-p
      (magit-run-git "add" ".")
    (magit-run-git "add" "-A" ".")))

(defun magit-tracking-name-unfucked-with (remote branch)
  branch)

(defun magit-quick-stash ()
  "Immediately stash with mesage

WIP on branchname: short-sha commit-message"
  (interactive)
  (magit-stash ""))


;; --- Obj-C switch between header and source ---

(defun objc-in-header-file ()
  (let* ((filename (buffer-file-name))
         (extension (car (last (split-string filename "\\.")))))
    (string= "h" extension)))

(defun objc-jump-to-extension (extension)
  (let* ((filename (buffer-file-name))
         (file-components (append (butlast (split-string filename
                                                         "\\."))
                                  (list extension))))
    (find-file (mapconcat 'identity file-components "."))))

;;; Assumes that Header and Source file are in same directory
(defun objc-jump-between-header-source ()
  (interactive)
  (if (objc-in-header-file)
      (objc-jump-to-extension "m")
    (objc-jump-to-extension "h")))

(defun objc-mode-customizations ()
  (define-key objc-mode-map (kbd "C-c h") 'objc-jump-between-header-source)
  (c-set-offset 'arglist-cont-nonempty 0))

(defun untabify-all (&optional blacklist)
  (interactive)
  (let ((should-run t))
    (mapcar (lambda (x)
              (when (string= (file-name-nondirectory buffer-file-name) x)
                (setq should-run nil))) blacklist)
    (when should-run
      (message "running untabify")
      (untabify (point-min) (point-max)))))


;;; gives a nice overview of spec files
(defun spec-overview ()
  (interactive)
  (occur "^[ \t]+\\(context\\|describe\\|it\\)")
  ;;(next-in-frame-window)
  (window-resize (get-buffer-window) 10))


(defun indent-and-open-newline (&optional previous)
  "Add a newline after current line and tab to indentation.
If PREVIOUS is non-nil, go up a line first."
  (interactive)
  (if previous
      (previous-line))
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun previous-indent-and-open-newline ()
  "call indent-and-open-newline with previous non-nil"
  (interactive)
  (indent-and-open-newline t))


(defun force-save ()
  (interactive)
  (not-modified 1)
  (save-buffer))

(defun toggle-fullscreen-nix ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
(provide 'my-functions)

(defun toggle-fullscreen-mac ()
"Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(defun async-command-and-highlight (command highlights &optional output-buffer)
  (if (get-buffer output-buffer)
      (kill-buffer output-buffer))
  (async-shell-command command output-buffer)
  (with-current-buffer output-buffer
    (mapcar
     (lambda (highlight)
       (highlight-phrase (car highlight) (cdr highlight)))
     highlights)))
