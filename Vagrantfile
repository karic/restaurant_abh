Vagrant.configure("2") do |config|
  config.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"
  #config.vm.provider "virtualbox" do |vb|
  #  config.vm.box = "ubuntu/xenial64"
  #  vb.memory = "2048"
  #end
  #config.vm.provision "shell", privileged: false,  path: "provision.sh"
  config.vm.provision "shell", privileged: false,  path: "puppet.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = "--verbose --debug"
  end
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
    rsync__exclude: [".git/"]



  config.vm.provider :aws do |aws, override|
    config.vm.box = "dummy"
    #aws.session_token = "SESSION TOKEN"
    aws.security_groups = [ 'vagrant' ]
    aws.keypair_name = "karic_praksa"
    aws.user_data = File.read("cloudconfig") 
    aws.ami = "ami-5055cd3f"
    aws.instance_type= "t2.micro"

    override.nfs.functional = false
    override.ssh.username = "vagrant"
    override.ssh.private_key_path = "/home/karic/karic_praksa.pem"
  end
end
