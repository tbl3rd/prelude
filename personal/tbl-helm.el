(require 'prelude-helm-everywhere)

'(require 'helm-jira)

'(setq helm-jira-url "https://broadinstitute.atlassian.net"
      helm-jira-user-name "tbl"
      helm-jira-project "DSDEGP"
      helm-jira-board-id 407)

(provide 'tbl-helm)
