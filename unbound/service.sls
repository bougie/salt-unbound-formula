{% from "unbound/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('unbound:lookup')) %}

unbound_service:
    service:
        - running
        - name: {{lookup.service}}

{% if salt['grains'].get('os') == 'Ubuntu' -%}
unbound_defaults:
    file.managed:
        - name: /etc/default/unbound
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - source: salt://unbound/files/default.jinja
        - require_in:
            - service: unbound_service
{%- endif -%}