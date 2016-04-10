default['freegeoip']['user'] = 'freegeoip'
default['freegeoip']['version'] = '3.1.4'
default['freegeoip']['archive'] = "freegeoip-#{node['freegeoip']['version']}-linux-amd64.tar.gz"
default['freegeoip']['url'] = "https://github.com/fiorix/freegeoip/releases/download/v#{node['freegeoip']['version']}/#{node['freegeoip']['archive']}"
default['freegeoip']['checksum'] = '50005da7f0a24a0e5873e9a0f12a8fbe0a3bbaaaffb9e7820ebc94b35dd58f85'
default['freegeoip']['binary'] = '/usr/local/bin/freegeoip'
default['freegeoip']['arguments'] = '-http 127.0.0.1:9999 -use-x-forwarded-for'
default['freegeoip']['service_wrapper'] = 'freegeoip'
