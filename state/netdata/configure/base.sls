{%- from "netdata/map.jinja" import netdata with context -%}

include:
  - netdata.install

netdata_main_config:
  file.managed:
    - name: {{ netdata.conf_dir }}{{ netdata.conf }}
    - backup: minion
    - source:
      - 'salt://netdata/files/netdata.conf.jinja'
    - user: {{ netdata.user }}
    - group: {{ netdata.group }}
    - mode: {{ netdata.file_mode }}
    - listen_in:
      - service: {{ netdata.service }}

netdata_stream_config:
  file.managed:
    - name: {{ netdata.conf_dir }}{{ netdata.sub_conf_dir }}stream.conf
    - backup: minion
    - source:
      - 'salt://netdata/files/stream.conf.jinja'
    - user: {{ netdata.user }}
    - group: {{ netdata.group }}
    - mode: {{ netdata.file_mode }}
    - defaults:
        netdata: {{ netdata }}
        datacenter: {{ pillar.get('datacenter', '') }}
        api_key: {{ pillar.get('confidential', {}).get('netdata').get('api_key', '') }}
    - listen_in:
      - service: {{ netdata.service }}