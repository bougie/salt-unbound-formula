# -*- coding: utf-8 -*-
# vim: ft=sls

{% from slspath+"/map.jinja" import unbound with context %}

unbound_package:
    pkg.installed:
        - name: {{unbound.package}}
