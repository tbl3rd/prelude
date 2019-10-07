'(add-hook 'python-mode 'run-python)

'(add-hook 'python-mode-hook
          (lambda ()
            (column-number-mode -1)
            (line-number-mode -1)))

'(elpy-enable)

(provide 'tbl-python)
