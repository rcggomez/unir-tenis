Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  
  # Configuración específica para Windows
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 1
    vb.name = "unir-tenis-vm"
  end

  # Sincronización de carpetas mejorada para Windows
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "v"
    ansible.compatibility_mode = "2.0"
    ansible.extra_vars = {
      ansible_python_interpreter: "/usr/bin/python3",
      deployment_env: "vagrant"
    }
  end
end