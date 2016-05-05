{% from "unbound/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('unbound:lookup')) %}
{% set rawmap = salt['pillar.get']('unbound', rawmap) %}

unbound_config:
    file.managed:
        - name: {{lookup.config_file}}
        - source: salt://unbound/files/unbound.conf.j2
        - template: jinja
        - user: root
        - group: root
        - mode: 0644
        - context:
            config: {{rawmap}}
