# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

#  config.vm.box = "bmcgonigle/centos68"
#  config.vm.box = "box-cutter/centos68"
  config.vm.box = "box"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end


  config.vm.define "gerrit" do |gerrit|
          gerrit.vm.network "public_network", ip: "192.168.50.10", bridge: "eth0"
	  gerrit.vm.hostname = "gerrit.test.com"
	#Test port
	  gerrit.vm.network "forwarded_port", guest: 8010, host: 8020
	  
	  gerrit.vm.provision "shell",
            path: "provision.sh"
  end

end
