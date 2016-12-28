# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.define "gerrit" do |gerrit|
          gerrit.vm.box = "bmcgonigle/centos68"
	  gerrit.vm.hostname = "gerrit.test.com"
          gerrit.vm.network :private_network, ip: "192.168.50.10", bridge: "eth0"
	  gerrit.vm.network "forwarded_port", guest: 8080, host: 8010
	  gerrit.vm.provision "shell",
            path: "gerrit.provision.sh"
  end

  config.vm.define "remote" do |remote|
          remote.vm.box = "bmcgonigle/centos68"
	  remote.vm.hostname = "remote.host.com"
          remote.vm.network :private_network, ip: "192.168.50.15", bridge: "eth0"
#	  remote.vm.network "forwarded_port", guest: 8080, host: 8010
	  remote.vm.provision "shell",
            path: "remote.provision.sh"
  end
end
