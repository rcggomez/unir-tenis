Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  
  # Configuración para VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 1
    vb.name = "unir-tenis-vm"
  end

  # Sincronización de carpetas robusta para Windows
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  # Provisionamiento confiable en dos etapas
  config.vm.provision "shell", inline: <<-SHELL
    echo "Instalando dependencias necesarias..."
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible python3-pip
    sudo pip3 install requests
    echo "Dependencias instaladas correctamente!"
  SHELL

  config.vm.provision "shell", inline: <<-SHELL
    echo "Ejecutando playbook de Ansible..."
    cd /vagrant
    ansible-playbook playbook.yml -i localhost, -c local -e "ansible_python_interpreter=/usr/bin/python3 deployment_env=vagrant"
    echo "Contenido del archivo partido.txt:"
    cat /vagrant/partido.txt
  SHELL
end