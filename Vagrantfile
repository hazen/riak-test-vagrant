# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "chef/ubuntu-12.04"
  #config.vm.box = "chef/centos-6.6"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network", bridge: 'en0: Ethernet 1', :mac => "0800275519ea"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/vagrant"

  ##########################################################################
  # Provisioning
  ##########################################################################
  # Script that installs Ansible onto the Guest, configures the Guest as a host for Ansible,
  #  then executes /vagrant/provisioning/playbook.yml to provision your Guest.
  #   - This script is kicked off upon the initial "vagrant up" command issued on this vagrant instance
  #     and then only when the "vagrant provision" command is issued on this instance
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/playbook.yml"
      # Debug to see what's actually going on
      ansible.verbose = "vvvv"
  end

  # Host machine name
  config.vm.hostname = 'vmware-vagrant'

  config.vm.provider "vmware_fusion" do |v|
      # Display the VirtualBox GUI when booting the machine
      #vb.gui = true

      # Customize the numbers of cores on the VM:
      v.vmx["numvcpus"] = "4"
      #vb.cpus = "4"

      # Customize the amount of memory on the VM:
      v.vmx["memsize"] = "4096"
      #vb.memory = "4096"

      # NAT
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
