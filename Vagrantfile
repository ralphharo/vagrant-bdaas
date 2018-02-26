# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
HOST_SYNC_FOLDER = '/Users/ralphh/Downloads/installs/bdaas'
CLIENT_SYNC_FOLDER = '/opt/installs'

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      config.ssh.username = "vagrant"
      config.ssh.password = "vagrant"
      config.ssh.insert_key = false
      mgmt_config.vm.box = "bento/centos-7.3"
      mgmt_config.vm.synced_folder HOST_SYNC_FOLDER, CLIENT_SYNC_FOLDER
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create load balancer
  config.vm.define :master do |master|
      config.ssh.username = "vagrant"
      config.ssh.password = "vagrant"
      config.ssh.insert_key = false
      master.vm.box = "bento/centos-7.3"
      master.vm.synced_folder HOST_SYNC_FOLDER, CLIENT_SYNC_FOLDER
      master.vm.hostname = "master"
      master.vm.network :private_network, ip: "10.0.15.11"
      master.vm.network "forwarded_port", guest: 80, host: 8090
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
    master.vm.provision :shell, path: "node_setup.sh"
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "worker#{i}" do |node|
        node.vm.box = "bento/centos-7.3"
        node.vm.synced_folder HOST_SYNC_FOLDER, CLIENT_SYNC_FOLDER
        node.vm.hostname = "worker#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "809#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    node.vm.provision :shell, path: "node_setup.sh"
    end
  end

end
