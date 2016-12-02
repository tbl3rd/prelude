(add-hook
 'java-mode-hook
 (lambda ()
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
