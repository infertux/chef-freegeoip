default['freegeoip']['user'] = 'freegeoip'
default['freegeoip']['version'] = '3.0.10'
default['freegeoip']['archive'] = "freegeoip-#{node['freegeoip']['version']}-linux-amd64.tar.gz"
default['freegeoip']['url'] = "https://github.com/fiorix/freegeoip/releases/download/v#{node['freegeoip']['version']}/#{node['freegeoip']['archive']}"
default['freegeoip']['checksum'] = '30b828faee350519c465d35fed36e0906f7c4e7af15f4501d709e9be882df027'
default['freegeoip']['binary'] = '/usr/local/bin/freegeoip'
default['freegeoip']['arguments'] = '-http 127.0.0.1:9999 -use-x-forwarded-for'
default['freegeoip']['service_wrapper'] = 'freegeoip'
