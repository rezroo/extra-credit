# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
RELEASE = "ubuntu/xenial64"
VBOXNET = "VirtualBox Host-Only Ethernet Adapter #5"

vms = {
  master: {
    is_master: "1",
    cpus: 2,
    ram: 2048,
    ips: [
      "192.168.50.10",   # access
    ]
  },
  worker1: {
    cpus: 2,
    ram: 2048,
    ips: [
      "192.168.50.11",   # access
    ]
  }
}

domain = "k8s.local"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = RELEASE
  config.vm.synced_folder "data/", "/srv/data"

  vms.each do |vm_name, vm_body|
    config.vm.define vm_name do |vm|
      vm.vm.host_name = vm_name.to_s + "." + domain
      vm_body[:ips].each do |ip|
        vm.vm.network "private_network", :ip => ip, virtualbox__hostonly: VBOXNET
      end
      vm.vm.provider "virtualbox" do |vb|
        vb.memory = vm_body[:ram]
        vb.cpus = vm_body[:cpus]
      end

      vm.vm.provision "shell", :path => "data/install-docker.sh"
      vm.vm.provision "shell", :path => "data/install-k8s.sh",
        :args => ["master", vm_body.fetch(:is_master, "0"), "ip", vm_body.fetch(:ips).at(0)]

    end
  end
end
