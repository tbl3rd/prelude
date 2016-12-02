(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-mode)

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.hl\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

(provide 'tbl-clojure)
