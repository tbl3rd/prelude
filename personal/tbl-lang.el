;; Customize various language modes.

(defmacro cmd (name &rest body)
  "Declare an interactive command without boilerplate."
  `(defun ,name ()
     ,(if (stringp (car body)) (car body))
     (interactive)
     ,@(if (stringp (car body)) (cdr `,body) body)))

;; Hack up a c-indentation-style close to Dan Nussbaum's for C.
;;
(defconst qrc-c-style
  '("gnu"
    (c-basic-offset . 4)
    (comment-column . 40)
    (fill-column . 75))
  "Dan Nussbaum likes this.")
(c-add-style "qrc-c" qrc-c-style)
(customize-set-variable 'c-default-style
                        (add-to-list 'c-default-style
                                     '(c++-mode . "qrc-c")))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'prelude-auto-install-alist '("\\.[CHch]\\'" c++-mode c++-mode))
(add-to-list 'prelude-auto-install-alist '("\\.m\\'" octave-mode octave-mode))

(provide 'tbl-lang)
