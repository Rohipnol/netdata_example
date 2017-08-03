{%- from "netdata/map.jinja" import netdata with context -%}

netdata_service_stopped:
  service.dead:
    - name: {{ netdata.service }}
    - enable: False