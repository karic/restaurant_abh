Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
  #config.vm.provision "shell", privileged: false,  path: "provision.sh"
  config.vm.provision "shell", privileged: false,  path: "puppet.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
  end

end
