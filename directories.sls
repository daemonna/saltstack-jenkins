/data:
  file.directory:
    - user: root
    - group: root
    - mode: 777
    - makedirs: true

/data/jenkins_home:
  file.directory:
    - user: jenkins
    - group: jenkins
    - mode: 755
    - makedirs: true
