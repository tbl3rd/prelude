(setq auth-source-debug t)

;; (setq auth-sourceos '("~/.authinfo"
;;                      "~/.authinfo.gpg"))

(setq tramp-remote-path
      (cons "/home/unix/tbl/bin" tramp-remote-path))

(setq tramp-verbose 6)

(provide 'tbl-tramp)
