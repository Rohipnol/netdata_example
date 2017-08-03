{# Import 'netdata' variable from map.jinja #}
{%- from "netdata/map.jinja" import netdata with context -%}

{# include state that configures yum repo file (not included in example) #}
include:
  - package_repos.configure.{{ netdata.pkg_repo }}

netdata_install:
  pkg.installed:
    - pkgs: {{ netdata.pkgs }}