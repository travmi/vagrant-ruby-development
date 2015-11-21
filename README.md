#CentOS 7 Blank VMs

This vagrant file sets up three vanilla CentOS 7 vms to use for testing.

To change vagrant boxes search for a new Vagrant box on:

https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=&q=

Then change agent2.vm.box = "centos/7" to reflect the box you chose.

#Getting Started

##Requirements

###Install Vagrant
- https://www.vagrantup.com/downloads.html

###Install VirtualBox
- https://www.virtualbox.org/wiki/Downloads

###Install Cygwin
- https://cygwin.com/install.html

####Cygwin Packages Needed
- tar
- rsync
- git
- bzip2
- mysql (client not server)
- scp
- sftp

##Clone Repository
```
git clone https://github.com/travmi/vagrant-centos7.git
```

##Start VMs

###Starting all three VMs
cd vagrant-centos7

```
vagrant up
```

##Starting Single VM
cd vagrant-centos7

```
vagrant up agent1
```

##Login
Check the Vagrant file for the IPs associated with each VM.

Using Cygwin - Password = vagrant
```
ssh root@172.16.90.5
```
