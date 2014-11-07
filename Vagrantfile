# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "172.17.8.130"
  
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "b9centos"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://github.com/beyond9/b9centos/releases/download/v7.0.0/centos7-20141106.box"

  config.vm.network :private_network, ip: "172.17.8.130"

  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest
  
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "b9apache::default"
    chef.add_recipe "b9apache::vagrant"
    
    chef.json.merge!({
      :apache => {
        :sites_path           => "/var/www",
        :server_port          => "80",
        :listen_ports         => ["80", "443"]
      }
    })
    
  end
end
