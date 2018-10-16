;; (require 'org-bullets)

(setq org-export-backends
      '(ascii confluence html icalendar latex))

(setq org-publish-project-alist
      '(("html"
         :components ("html-html"
                      "html-other"))
        ("html-html"
         :recursive t
         :base-directory "~/qrc/html/"
         :base-extension "org"
         :publishing-directory "/electron:/home/tbl/public_html"
         :publishing-function org-publish-org-to-html)
        ("html-other"
         :recursive t
         :base-directory "~/qrc/html/"
         :base-extension "gif\\|jpg\\|org\\|png"
         :publishing-directory "/electron:/home/tbl/public_html"
         :publishing-function org-publish-attachment)))

(add-to-list 'load-path (expand-file-name "~/Src/Elisp/org/lisp"))
(add-to-list 'load-path (expand-file-name "~/Src/Elisp/org/contrib/lisp"))
;; (add-to-list 'load-path (expand-file-name "~/Src/Elisp/org-jira"))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;; Work around org-mode babel trying to write remote temp files into a
;; MacOS temp directory.
;;
(add-hook 'org-mode-hook
          (lambda ()
            ;; (org-bullets-mode 1)
            (column-number-mode -1)
            ;; (line-number-mode -1)
            (setq org-confirm-babel-evaluate nil
                  temporary-file-directory "/tmp" ;; help tramp
                  whitespace-line-column nil
                  whitespace-style '(face tabs empty trailing))
            (local-set-key (kbd "C-c l") 'org-store-link)))

(setq org-babel-clojure-backend 'cider
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0
      org-list-empty-line-terminates-plain-lists t
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-support-shift-select 'always)

;; (setq jiralib-url "https://jira-hzn.eng.vmware.com")
;; (setq request-log-level 'debug)
;; (setq request-message-level 'debug)

'(prelude-require-package 'org)

'(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (latex . t)
   (org . t)
   (sh . t)
   (sql . t)))

'(add-to-list
 'org-src-lang-modes
 '("dot" . graphviz-dot))

;; (require 'ox-confluence)
;; (require 'ox-confluence-en)

(setq epresent-mode-line nil)

'(add-hook 'epresent-mode-hook
          (lambda ()
            (setq epresent-mode-line nil)))

(provide 'tbl-org)
