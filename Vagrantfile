# -*- mode: ruby -*-
# vi: set ft=ruby :

$hostnames = <<EOF
echo "Setting up /etc/hosts"
echo -e "172.16.92.5\truby1\truby1.local.lan\n172.16.92.6\truby2\truby2.local.lan\n172.16.92.7\truby3\truby3.local.lan\n" >> /etc/hosts
EOF

# Install packages I like
$packages = <<EOF
echo "Installing extra packages"
yum update -y
yum install vim git rsync wget telnet bind-utils traceroute net-tools -y
setenforce 0
sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
EOF

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

 config.vm.define "ruby1" do |ruby1|
    ruby1.vm.box = "geerlingguy/centos7"
    ruby1.vm.hostname = "ruby1"
    ruby1.vm.network :private_network, ip: "172.16.92.5"
    ruby1.vm.synced_folder "ruby", "/var/www"
    ruby1.vm.synced_folder "ruby-devel", "/root/ruby-devel"
    ruby1.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    ruby1.vm.provision "shell", inline: "yum install nginx -y; cp /vagrant/configs/blog.conf /etc/nginx/conf.d/blog.conf; rm -rf /etc/nginx/nginx.conf; cp /vagrant/configs/nginx.conf /etc/nginx/nginx.conf; systemctl restart nginx"
    ruby1.vm.provision "shell", inline: "yum install ruby rubygems ruby-devel make gcc gcc-c++ -y; gem install jekyll, gem install bundler"
  end

 config.vm.define "ruby2" do |ruby2|
    ruby2.vm.box = "geerlingguy/centos7"
    ruby2.vm.hostname = "ruby2"
    ruby2.vm.network :private_network, ip: "172.16.92.6"
    ruby2.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

 config.vm.define "ruby3" do |ruby3|
    ruby3.vm.box = "geerlingguy/centos7"
    ruby3.vm.hostname = "ruby3"
    ruby3.vm.network :private_network, ip: "172.16.92.7"
    ruby3.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  hosts = ["ruby1", "ruby2", "ruby3"]
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
