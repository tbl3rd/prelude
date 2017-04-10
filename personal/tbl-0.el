;; Customize miscellaneous personal stuff.

(prefer-coding-system 'utf-8)
(put 'narrow-to-region 'disabled nil)

(defvar tbl3rd-font "Monaco 16")
(defvar tbl3rd-frame-height 40)

(when (equal "lyonst" (getenv "USER"))
   (setq tbl3rd-font "Monaco 14")
   (setq tbl3rd-frame-height 44))

;; For presentations.
;;
;; (setq prelude-theme nil)
;; (setq tbl3rd-font "Monaco 28")
;; (global-linum-mode)

(set-frame-font tbl3rd-font nil t)
(add-to-list 'default-frame-alist (cons 'font tbl3rd-font))
(add-to-list 'default-frame-alist (cons 'height tbl3rd-frame-height))
(add-to-list 'default-frame-alist (cons 'width 81))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq ns-command-modifier 'meta)

(setq gnus-home-directory "~/Mail")
(setq gnus-directory "~/Mail")
(setq gnus-default-directory "~/Mail")

(define-minor-mode tbl3rd-minor-mode
  "my minor mode" t " tbl3rd"
  (let ((keymap (make-keymap)))
    ;; (define-key keymap (kbd "M-o") 'dired-omit-mode)
    keymap))

(tbl3rd-minor-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)

(add-hook 'Info-mode-hook
          (lambda ()
            (add-to-list 'Info-directory-list
                         (expand-file-name "tbl-info"
                                           prelude-personal-dir))))

(defmacro cmd (name &rest body)
  "Declare an interactive command without boilerplate."
  `(defun ,name ()
     ,(if (stringp (car body)) (car body))
     (interactive)
     ,@(if (stringp (car body)) (cdr `,body) body)))

(defun guess-tab-width (&optional n)
  "  Display the current buffer with a succession of tab-width settings.
  Reply with y to select the currently displayed setting.  Reply with n
  to try the next setting.  C-g restores the original setting.  Prefix
  with the number of columns at which to start trying.  The default is 1."
  (interactive "p")
  (let ((current tab-width) (w n) (high 23)
        (show (function (lambda (n)
                          (setq tab-width n)
                          (switch-to-buffer (current-buffer))))))
    (unwind-protect
        (setq current
              (catch 'width
                (while (< w high)
                  (funcall show w)
                  (if (y-or-n-p (format "%d columns? " w))
                      (throw 'width w)
                    (setq w (+ 1 w))))
                current))
      (funcall show current))))

(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory (concat dotfiles-dir "elpa-to-submit/") 0))

(defun regen-autoloads (&optional force-regen)
  "Regenerate the autoload definitions file if necessary and load it."
  (interactive "P")
  (let ((autoload-dir (concat dotfiles-dir "/elpa-to-submit"))
        (generated-autoload-file autoload-file))
    (when (or force-regen
              (not (file-exists-p autoload-file))
              (some (lambda (f) (file-newer-than-file-p f autoload-file))
                    (directory-files autoload-dir t "\\.el$")))
      (message "Updating autoloads...")
      (let (emacs-lisp-mode-hook)
        (update-directory-autoloads autoload-dir))))
  (load autoload-file))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(setq magit-last-seen-setup-instructions "1.4.0")

;; (pdf-tools-install)

;; (set-keyboard-coding-system nil)
;; (setq mac-command-modifier 'meta)

(provide 'tbl-0) 
