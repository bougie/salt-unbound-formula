# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "unbound/defaults.yaml" import lookup with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('unbound:lookup')) %}

unbound_package:
    pkg.installed:
        - name: {{lookup.package}}
