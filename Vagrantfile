Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.define "docker_study" do |docker_study|
    docker_study.vm.network "public_network", ip: "192.168.100.130"

    docker_study.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
      vb.name = "ubuntu_docker_study"
    end
    docker_study.vm.provision "shell", inline: "apt-get update && apt-get install -y docker.io"
  end
  
end