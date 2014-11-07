include_recipe "apache2"

execute "Stop firewalld" do
  command "systemctl stop firewalld"
  action :run
end

execute "Disable firewalld" do
  command "systemctl disable firewalld"
  action :run
end