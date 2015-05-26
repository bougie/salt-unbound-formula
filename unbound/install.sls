{% from "unbound/default.yml" import lookup with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('unbound:lookup')) %}

unbound_package:
    pkg.installed:
        - name: {{lookup.package}}
