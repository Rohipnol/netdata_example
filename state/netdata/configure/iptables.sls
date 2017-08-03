{# Import netdata pillar data #}
{%- from "netdata/map.jinja" import netdata with context -%}
{# Import iptables jinja macro to add new rule #}
{%- from "iptables/extend/init.sls" import iptables_add_rule -%}

include:
  - iptables.extend

{# Import jinja macro from iptables state, (not including in example) #}
{{  iptables_add_rule (
      name = 'netdata',
      ports = [netdata.port],
    )
}}