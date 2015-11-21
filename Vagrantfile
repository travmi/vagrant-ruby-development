# -*- mode: ruby -*-
# vi: set ft=ruby :

$hostnames = <<EOF
echo "Setting up /etc/hosts"
echo -e "172.16.90.5\tagent1\tagent1.local.lan\n172.16.90.6\tagent2\tagent2.local.lan\n172.16.90.7\tagent3\tagent3.local.lan\n" >> /etc/hosts
EOF

# Install packages I like
$packages = <<EOF
echo "Installing extra packages"
yum update -y
yum install vim git rsync wget telnet bind-utils traceroute -y
setenforce 0
sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
EOF

# Clean up /etc/resolv.conf if it tries to set domain/search
#$resolv = <<EOF
#echo "Sanitizing /etc/resolv.conf"
#sed -i '/search/d' /etc/resolv.conf
#sed -i '/domain/d' /etc/resolv.conf
#EOF

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

 config.vm.define "agent1" do |agent1|
    agent1.vm.box = "geerlingguy/centos7"
    agent1.vm.hostname = "agent1.local.lan"
    agent1.vm.network :private_network, ip: "172.16.90.5"
    agent1.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

 config.vm.define "agent2" do |agent2|
    agent2.vm.box = "geerlingguy/centos7"
    agent2.vm.hostname = "agent2.local.lan"
    agent2.vm.network :private_network, ip: "172.16.90.6"
    agent2.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

 config.vm.define "agent3" do |agent3|
    agent3.vm.box = "geerlingguy/centos7"
    agent3.vm.hostname = "agent3.local.lan"
    agent3.vm.network :private_network, ip: "172.16.90.7"
    agent3.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  hosts = ["agent1", "agent2", "agent3"]
  hosts.each do |i|
    config.vm.define "#{i}" do |node|
        node.vm.provision "shell", inline: $hostnames
        node.vm.provision "shell", inline: $packages
    end
  end

#  clients = ["agent1", "agent2", "agent3"]
#  clients.each do |i|
#    config.vm.define "#{i}" do |node|
#    	node.vm.provision "shell",
#      	  inline: ""
#        node.vm.provision "shell",
#          inline: ""
#    end
#  end

end
