include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_rewrite"

service 'apache2' do
  service_name node['apache']['package']
  case node['platform_family']
  when 'rhel'
    reload_command '/sbin/service httpd restart'
  when 'debian'
    provider Chef::Provider::Service::Debian
  when 'arch'
    service_name 'httpd'
  end
  supports [:start, :restart, :reload, :status]
  action [:enable, :start]
  only_if "#{node['apache']['binary']} -t", :environment => { 'APACHE_LOG_DIR' => node['apache']['log_dir'] }, :timeout => 2
end

cookbook_file "#{node[:apache][:dir]}/ssl/server.crt" do
  source "server.crt"
  mode "0644"
  owner "root"
  group "root"
  backup false
end

cookbook_file "#{node[:apache][:dir]}/ssl/server.key" do
  source "server.key"
  mode "0644"
  owner "root"
  group "root"
  backup false
end

apache_module "substitute" do
   enable true
end

apache_module "include" do
    enable true
end

apache_module "rewrite" do
    enable true
end

apache_module "ssl" do
    enable true
end

template "#{node[:apache][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2"), :delayed
  backup false
end

apache_site "default" do
  enable true
end