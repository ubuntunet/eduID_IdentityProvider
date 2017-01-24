# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Use the same key for each machine 
  config.ssh.insert_key = false

  config.vm.define "vagrant_idp" do |idp|
    idp.vm.box = "ubuntu/trusty64"
    idp.vm.network "private_network", ip: "192.168.33.44"
    idp.vm.network :forwarded_port, guest: 22, host: 2244, id: 'ssh'
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "identity_provider.yml"
    ansible.inventory_path = "inventories/development"
    ansible.limit = 'all'
  end
  
end
