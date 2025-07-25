#!/bin/bash

# Instalar dependencias
apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ansible \
    curl

pip3 install requests

# Ejecutar playbook
cd /vagrant
ansible-playbook playbook.yml -i localhost, -c local -e "ansible_python_interpreter=/usr/bin/python3 deployment_env=docker"

# Mantener el contenedor activo para ver resultados
cat /vagrant/partido.txt
tail -f /dev/null