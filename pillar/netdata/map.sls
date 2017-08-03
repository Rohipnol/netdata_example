netdata:
  map:
    RedHat:
      pkg_repo: 'netdata'
      user: 'netdata'
      group: 'netdata'
      port: '19999'
      file_mode: '0644'
      dir_mode: '0755'
      service: 'netdata'
      pkgs:
        - netdata
        - zlib-devel
        - libuuid-devel
{%- if grains.get('osmajorrelease', '0') >= 7 %}
        - libnetfilter_acct
{%- endif %}
      conf_dir: '/etc/netdata/'
      sub_conf_dir: 'conf.d/'
      conf_file: 'netdata.conf'