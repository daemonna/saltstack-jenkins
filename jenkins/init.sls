{% set jenkins = pillar.get('jenkins', {}) -%}
{% set home = jenkins.get('home', '/data/jenkins_home') -%}
{% set user = jenkins.get('user', 'jenkins') -%}
{% set group = jenkins.get('group', user) -%}

jenkins:
  {% if grains['os_family'] in ['RedHat', 'Debian'] %}
  pkgrepo.managed:
    - humanname: Jenkins upstream package repository
    {% if grains['os_family'] == 'RedHat' %}
    - baseurl: http://pkg.jenkins-ci.org/redhat-stable
    - gpgkey: http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
    {% elif grains['os_family'] == 'Debian' %}
    - name: deb http://pkg.jenkins-ci.org/debian-stable binary/
    - key_url: http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key
    {% endif %}
    - require_in: 
      - pkg: jenkins
  {% endif %}
  pkg.latest:
    - refresh: True
  service.running:
    - enable: True
    - watch:
      - pkg: jenkins
