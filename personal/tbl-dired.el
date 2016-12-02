(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-omit-extensions nil)
            (setq dired-omit-files (concat dired-omit-files "\\|^\\..+"))
            (dired-omit-mode 1)))

(provide 'tbl-dired)
