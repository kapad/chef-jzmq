# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "chef-jzmq-berkshelf"

  config.vm.box = "ubuntu_12-04_precise_64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|

    chef.run_list = [
      "recipe[chef-jzmq::test]"
    ]
  end
end
