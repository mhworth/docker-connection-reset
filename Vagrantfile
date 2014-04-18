Vagrant.configure("2") do |config|
  config.vm.box = "base"
  config.vm.network "private_network", ip: "10.42.42.42"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision "shell",
    inline: "echo Setting docker listen options; echo 'DOCKER_OPTS=\"-r=true ${DOCKER_OPTS} -H unix:///var/run/docker.sock -H tcp://10.42.42.42:4243\"' > /etc/default/docker;"
  config.vm.provision "docker" do |d|
    d.pull_images "ubuntu"
  end
end
