Vagrant.configure("2") do |config|
  # Define the base box
  config.vm.box = "ubuntu/bionic64"

  # Configure VM network settings
  config.vm.network "private_network", type: "dhcp"

  # Configure VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"  # Set memory to 2GB
    vb.cpus = 2         # Set CPU to 2 cores
  end

  # Provision the VM
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo apt-get install -y python3-pip
    sudo usermod -aG docker ${USER}
    sudo pip3 install minio

    # Create a .env file with MinIO credentials
    echo "MINIO_ACCESS_KEY=${ENV['MINIO_ACCESS_KEY']}" >> /home/vagrant/.env
    echo "MINIO_SECRET_KEY=${ENV['MINIO_SECRET_KEY']}" >> /home/vagrant/.env
  SHELL
end
