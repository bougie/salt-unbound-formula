# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "unbound/defaults.yaml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('unbound:lookup')) %}
{% set rawmap = salt['pillar.get']('unbound', rawmap, merge=True) %}

unbound_config:
    file.managed:
        - name: {{lookup.config_file}}
        - source: salt://unbound/files/unbound.conf.jinja
        - template: jinja
        - user: root
        - group: root
        - mode: 0440
        - context:
            config: {{rawmap}}
