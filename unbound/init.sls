# -*- coding: utf-8 -*-
# vim: ft=sls

# Meta-state to fully install unbound.

include:
    - unbound.install
    - unbound.config
    - unbound.service

extend:
    unbound_service:
        service:
            - watch:
                - file: unbound_config
                - pkg: unbound_package
            - require:
                - file: unbound_config
    unbound_config:
        file:
            - require:
                - pkg: unbound_package
