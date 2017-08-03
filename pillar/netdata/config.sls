netdata:
  config:
    master: '-stats-nd.company.com'
    bind_ip: {{ grains.get('fqdn_ip4', ['127.0.0.1'])[0] }}