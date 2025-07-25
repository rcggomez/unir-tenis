#!/bin/bash

# Actualizar sistema
apt-get update -y

# Instalar dependencias
apt-get install -y \
    python3 \
    python3-pip \
    ansible \
    curl \
    git

pip3 install requests boto3

# Clonar repositorio (ajusta la URL)
git clone https://github.com/tu-repositorio/unir-tenis.git /home/ubuntu/unir-tenis

# Ejecutar playbook
cd /home/ubuntu/unir-tenis
ansible-playbook playbook.yml -i localhost, -c local -e "ansible_python_interpreter=/usr/bin/python3 deployment_env=aws_ec2"

# Copiar resultados a S3 (opcional)
aws s3 cp /home/ubuntu/unir-tenis/partido.txt s3://tu-bucket-unir/partido.txt