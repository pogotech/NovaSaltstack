webserver:
  pkg.installed:
    - pkgs:
      - httpd

httpd:
  service:
   - running
   - watch:
     - pkg: webserver

/var/www/html/index.html:
  file.managed:
    - source: salt://website/web.html
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: webserver
