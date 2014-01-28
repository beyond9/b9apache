# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "b9apache-berkshelf"
  
  config.vm.box = "Berkshelf-CentOS-6.5.3"

  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.network :private_network, ip: "33.33.33.20"

  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest
  
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "b9apache::default"
    chef.add_recipe "b9apache::vagrant"
    
    chef.json.merge!({
      :apache => {
        :sites_path           => "/var/www",
        :server_port          => "8887",
        :listen_ports         => ["8887", "443"]
      }
    })
    
  end
end
