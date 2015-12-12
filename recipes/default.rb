user node['freegeoip']['user'] do
  shell "/bin/false"
  supports manage_home: false
end

archive_file = "#{Chef::Config['file_cache_path']}/#{node['freegeoip']['archive']}"
extract_path = archive_file.gsub(/\.tar\.gz\Z/, '')

remote_file archive_file do
  source node['freegeoip']['url']
  owner node['freegeoip']['user']
  group node['freegeoip']['user']
  mode "0400"
  not_if { ::File.exist?(archive_file) }
end

execute "verify checksum" do
  cwd ::File.dirname(archive_file)
  command %(echo "#{node['freegeoip']['checksum']}  #{archive_file}" | sha256sum -c -)
end

bash "extract archive" do
  cwd ::File.dirname(archive_file)
  code <<-EOH
    rm -rf #{extract_path}
    tar xf #{archive_file}
    cp #{extract_path}/freegeoip #{node['freegeoip']['binary']}
  EOH
end

file node['freegeoip']['binary'] do
  owner node['freegeoip']['user']
  group node['freegeoip']['user']
  mode "0500"
end

template "/etc/init.d/#{node['freegeoip']['service_wrapper']}" do
  source "init.d.erb"
  owner node['freegeoip']['user']
  group node['freegeoip']['user']
  mode "0500"
  variables(
    binary:    node['freegeoip']['binary'],
    arguments: node['freegeoip']['arguments'],
  )
end

service node['freegeoip']['service_wrapper'] do
  supports   [start: true, stop: true, restart: true]
  action     [:enable, :start]
  subscribes :restart, "template[/etc/init.d/#{node['freegeoip']['service_wrapper']}]", :delayed
end
