# vim: ft=sls

# Meta-state to fully install unbound.

{% from "unbound/map.jinja" import unbound with context %}

unbound:
  pkg.installed:
    - name: {{ unbound.package }}
  service.running:
    - name: {{ unbound.service }}
    - enable: true
    - require:
      - pkg: {{ unbound.package }}

include:
  - unbound.config