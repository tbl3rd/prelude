(defconst broad-java-style
  '((c-basic-offset . 4)
    (c-offsets-alist
     (inline-open . +)
     (topmost-intro-cont . c-lineup-topmost-intro-cont)
     (knr-argdecl-intro . +)
     (substatement-open . +)
     (substatement-label . 2)
     (label . 2)
     (statement-case-open . 0)
     (statement-cont . +)
     (access-label . -)
     (func-decl-cont . +)
     (defun-open . 0)
     (defun-close . 0)
     (class-open . 0)
     (knr-argdecl . 0)
     (annotation-var-cont . +)
     (member-init-intro . +)
     (member-init-cont . c-lineup-multi-inher)
     (inher-intro . +)
     (block-open . 0)
     (brace-list-open . 0)
     (brace-list-close . 0)
     (brace-list-intro . +)
     (brace-list-entry . 0)
     (brace-entry-open . 0)
     (statement-case-intro . +)
     (substatement . +)
     (case-label . 0)
     (do-while-closure . 0)
     (else-clause . 0)
     (catch-clause . 0)
     (stream-op . c-lineup-streamop)
     (cpp-macro-cont . +)
     (cpp-define-intro c-lineup-cpp-define +)
     (friend . 0)
     (objc-method-intro . [0])
     (objc-method-args-cont . c-lineup-ObjC-method-args)
     (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
     (extern-lang-open . 0)
     (namespace-open . 0)
     (module-open . 0)
     (composition-open . 0)
     (extern-lang-close . 0)
     (namespace-close . 0)
     (module-close . 0)
     (composition-close . 0)
     (inextern-lang . +)
     (innamespace . +)
     (inmodule . +)
     (incomposition . +)
     (template-args-cont c-lineup-template-args +)
     (inlambda . c-lineup-inexpr-block)
     (lambda-intro-cont . +)
     (inexpr-statement . +)
     (inexpr-class . +)
     (topmost-intro . 0)
     (arglist-intro . +)
     (arglist-cont . 0)
     (annotation-top-cont . 0)
     (inclass . +)
     (defun-block-intro . +)
     (inline-close . 0)
     (statement-block-intro . +)
     (statement . 0)
     (block-close . 0)
     (class-close . 0)
     (c . c-lineup-C-comments)
     (inher-cont . c-lineup-multi-inher)
     (string . -1000)
     (comment-intro . c-lineup-comment)
     (arglist-cont-nonempty . ++)       ; was +
     (arglist-close . 0) ; was c-lineup-close-paren
     (cpp-macro . -1000)))
  "Broad Institute")

(c-add-style "Broad Institute" broad-java-style)

(add-hook
 'java-mode-hook
 (lambda ()
   (c-set-style "Broad Institute")
   (let ((map (make-sparse-keymap)))
     (define-key map [(control ?\,)]    'jtags-member-completion)
     (define-key map [(meta ?\j)]       'jtags-show-declaration)
     (define-key map [(meta ?\.)]       'xref-find-definitions)
     (define-key map [(meta ?\,)]       'xref-pop-marker-stack)
     (define-key map [(meta f1)]        'jtags-show-documentation)
     (define-key map [(control c) ?\,] 'jtags-update-this-tags-file)
     (setq jtags-mode-map map))
   (jtags-mode)))

(add-hook
 'jdee-mode-hook
 (lambda ()
   (setq
    jdee-project-file-version "1.0"
    jdee-server-dir "/Users/lyonst/Vmware/Git/jdee-server/target"
    jdee-jdk-registry
    '(("1.7" . "/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home")
      ("1.8" . "/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home"))
    jdee-jdk '("1.8")
    jdee-sourcepath
    '("/Users/lyonst/Vmware/Git/cloud/sp-main/dev-integration/system-tests/SystemTests/src")
    jdee-global-classpath
    '("/Users/lyonst/Vmware/Git/cloud/sp-main/build/beta/maven-repo/")
    jdee-built-class-path
    '("/Users/lyonst/Vmware/Git/cloud/sp-main/dev-integration/system-tests/SystemTests/target")
    jdee-maven-project-dir "")))

;; (require 'ensime)

;; (setq ensime-startup-dirname "/Users/tbl/.emacs.d/elpa/ensime-1.0.1")

;; (setq ensime-default-java-flags
;;       (mapconcat 'identity '("-Xss2m"
;;                              "-Xms2048m"
;;                              "-Xmx2048m"
;;                              "-XX:ReservedCodeCacheSize=128m"
;;                              "-XX:MaxMetaspaceSize=256m") " "))

;; (add-to-list 'auto-mode-alist '("\\.wdl\\'" . scala-mode))

(provide 'tbl-java)
