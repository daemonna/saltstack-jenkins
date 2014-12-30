jenkins_group:
  group.present:
    - name: jenkins

jenkins_user:
  user.present:
    - name: jenkins
    - groups:
      - jenkins
