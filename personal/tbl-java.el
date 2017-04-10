(add-hook
 'java-mode-hook
 (lambda ()
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

(provide 'tbl-java)
