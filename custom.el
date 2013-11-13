(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes (quote (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode coffee-mode haml-mode sass-mode objc-mode)))
 '(ac-use-fuzzy t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(c-basic-offset 4)
 '(c-default-style "java")
 '(cc-other-file-alist (quote (("\\.cc\\'" (".hh" ".h")) ("\\.hh\\'" (".cc" ".C")) ("\\.c\\'" (".h")) ("\\.h\\'" (".m" ".m" ".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm")) ("\\.C\\'" (".H" ".hh" ".h")) ("\\.H\\'" (".C" ".CC")) ("\\.CC\\'" (".HH" ".H" ".hh" ".h")) ("\\.HH\\'" (".CC")) ("\\.c\\+\\+\\'" (".h++" ".hh" ".h")) ("\\.h\\+\\+\\'" (".c++")) ("\\.cpp\\'" (".hpp" ".hh" ".h")) ("\\.hpp\\'" (".cpp")) ("\\.cxx\\'" (".hxx" ".hh" ".h")) ("\\.hxx\\'" (".cxx")) ("\\.m\\'" (".h")))))
 '(coffee-command "/Users/adam/projects/thoughtstream-collaboration_server/node_modules/.bin/coffee")
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes (quote ("99cbc2aaa2b77374c2c06091494bd9d2ebfe6dc5f64c7ccdb36c083aff892f7d" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" "3c708b84612872e720796ea1b069cf3c8b3e909a2e1da04131f40e307605b7f9" "7df1ccf73c0e12f97a91aaf5fed6a7594b154137190f4ab3232b3cbc42bc9052" "d24e10524bb50385f7631400950ba488fa45560afcadd21e6e03c2f5d0fad194" "0bac11bd6a3866c6dee5204f76908ec3bdef1e52f3c247d5ceca82860cccfa9d" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "f38dd27d6462c0dac285aa95ae28aeb7df7e545f8930688c18960aeaf4e807ed" "944f3086f68cc5ea9dfbdc9e5846ad91667af9472b3d0e1e35a9633dcab984d5" "c56fd34f8f404e6e9e6f226c6ce2d170595acc001741644d22b49e457e3cd497" "27b53b2085c977a8919f25a3a76e013ef443362d887d52eaa7121e6f92434972" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "1760322f987b57884e38f4076ac586c27566a1d7ed421b67843c8c98a1501e3a" "6b00751018da9a360ac8a7f7af8eb134921a489725735eba663700cebc12fa6f" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" default)))
 '(debug-on-error t)
 '(dired-auto-revert-buffer (quote dired-directory-changed-p))
 '(electric-pair-mode t)
 '(emux-completing-read-command (quote ido-completing-read))
 '(emux-term-program "/bin/zsh")
 '(fci-rule-color "#383838")
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(grep-command "grep -nH -e ")
 '(grep-files-aliases (quote (("all" . "* .*") ("el" . "*.el") ("ch" . "*.[ch]") ("c" . "*.c") ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++") ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++") ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++") ("h" . "*.h") ("l" . "[Cc]hange[Ll]og*") ("m" . "[Mm]akefile*") ("tex" . "*.tex") ("texi" . "*.texi") ("asm" . "*.[sS]") ("ruby" . "*.rb *.yml"))))
 '(grep-find-command (quote ("find . -type f -exec grep -nH -e  {} +" . 34)))
 '(grep-find-template "find . <X> -type f <F> -exec grep <C> -nH -e <R> {} +")
 '(grep-highlight-matches nil)
 '(grep-template "grep <X> <C> -nH -e <R> <F>")
 '(grep-use-null-device nil)
 '(ido-auto-merge-delay-time 5)
 '(ido-decorations (quote ("
-> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(kill-read-only-ok t)
 '(kill-whole-line t)
 '(mac-pass-command-to-system nil)
 '(magit-completing-read-function (quote magit-ido-completing-read))
 '(magit-default-tracking-name-function (quote magit-tracking-name-unfucked-with))
 '(magit-save-some-buffers nil)
 '(multi-term-program "/bin/zsh" t)
 '(org-return-follows-link t)
 '(org-todo-keywords (quote ((sequence "TODO" "DOING" "DONE(d!)"))))
 '(show-paren-mode t)
 '(tramp-default-method "ssh")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell t)
 '(wget-command "/usr/local/bin/wget")
 '(wget-download-directory "~/Downloads"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
;;  '(ac-completion-face ((t (:foreground "#555" :underline "#F0F"))))
;;  '(magit-diff-add ((t (:inherit diff-added :foreground "green"))))
;;  '(magit-diff-del ((t (:inherit diff-removed :foreground "red"))))
;;  '(magit-item-highlight ((t (:inherit highlight :background "#222"))))
;;  '(popup-face ((t (:background "#111" :foreground "#888"))))
;;  '(popup-menu-face ((t (:background "#111" :foreground "#0F0"))))
;;  '(popup-menu-selection-face ((t (:background "#111" :foreground "yellow"))))
;;  '(term ((t (:inherit Default)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#383830" :foreground "#F8F8F2"))))
 '(magit-diff-add ((t (:foreground "#0f0"))))
 '(magit-diff-del ((t (:foreground "#f00"))))
 '(magit-item-highlight ((t (:background "#22252f"))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "#E6DB74"))))
 '(powerline-active1 ((t (:inherit mode-line :background "grey22"))))
 '(powerline-active2 ((t (:inherit mode-line :background "chartreuse3"))))
 '(term-color-blue ((t (:background "blue2" :foreground "#89BDFF"))) t)
 '(term-color-cyan ((t (:background "cyan3" :foreground "#ae81ff"))) t)
 '(term-color-green ((t (:background "green3" :foreground "#a6e22e"))) t)
 '(term-color-magenta ((t (:background "magenta3" :foreground "#fd5ff1"))) t)
 '(term-color-red ((t (:background "red3" :foreground "#f92672"))) t)
 '(term-color-white ((t (:background "white" :foreground "#e6e6e6"))) t)
 '(term-color-yellow ((t (:background "yellow3" :foreground "#e6db74"))) t)
 '(vertical-border ((t (:foreground "#141411")))))
