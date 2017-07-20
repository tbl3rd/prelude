(require 'aggressive-indent)

(defun tbl-clojure-hook ()
  "Run this in any Clojure buffer."
  (smartparens-strict-mode t)
  (local-set-key (kbd "M-j") 'sp-join-sexp)
  (aggressive-indent-mode))

(defun tbl-cider-hook ()
  "Run this in any Clojure buffer when CIDER is active."
  (setq cider-pprint-fn 'fipp)          ; faster pretty-printer
  (company-mode)
  (eldoc-mode)
  (smartparens-strict-mode t))

(add-hook 'clojure-mode-hook    'tbl-clojure-hook)
(add-hook 'cider-mode-hook      'tbl-cider-hook)
(add-hook 'cider-repl-mode-hook 'tbl-cider-hook)

(add-to-list 'auto-mode-alist '("\\.cljs.hl\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

(provide 'tbl-clojure)
