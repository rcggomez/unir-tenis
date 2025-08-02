# 🎾 Generador Automático de Partidos de Tenis - UNIR

Este proyecto automatiza la creación de un archivo con la información de un partido de tenis entre dos jugadores, usando **Ansible** y **Vagrant**. Adicionalmente, el despliegue está preparado para funcionar también en **Docker Desktop** y **AWS EC2**, lo cual permite practicar la portabilidad de automatizaciones en distintos entornos.

---

## 📋 Objetivos

- Automatizar la generación de un partido de tenis con datos de dos jugadores.
- Practicar el uso de **playbooks**, **roles**, **variables** y módulos de Ansible.
- Ejecutar la solución en distintos entornos (local y nube).

---

## 🖥️ Tecnologías utilizadas

- [Ansible](https://www.ansible.com/)
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- [Docker](https://www.docker.com/)
- [AWS EC2](https://aws.amazon.com/ec2/)
- API pública: [https://randomuser.me/](https://randomuser.me/api/)

---

## 📁 Estructura del proyecto
```
UNIR-TENIS/
│
├── .vagrant/ # Archivos generados por Vagrant
├── roles/
│ └── partido/
│ ├── tasks/
│ │ └── main.yml # Lógica principal del rol Ansible
│ └── templates/
│ └── partido.txt.j2 # Plantilla Jinja2 del archivo final
│
├── scripts/
│ ├── docker_entrypoint.sh # Script de arranque en Docker
│ ├── ec2_user_data.sh # Script de usuario para EC2
│ └── aws_ec2_deploy.sh # Script para despliegue en AWS EC2
│
├── docker-compose.yml # Infraestructura Docker
├── partido_vars.yml # Variables para el primer jugador
├── partido.txt # Salida esperada generada
├── playbook.yml # Playbook principal de Ansible
├── Vagrantfile # Definición de VM y provisión con Ansible

```


---

## ⚙️ Requisitos previos

- **VirtualBox** y **Vagrant** instalados para ejecución local
- **Docker Desktop** instalado (opcional)
- **Cuenta AWS** con acceso SSH y clave `.pem` (opcional)
- Ansible instalado si se ejecuta en EC2 o directamente en windows 11 ([Instalar Ansible en Windows.md](https://github.com/rcggomez/unir-tenis/blob/41073608e0a1ed694261099166847dc4ea935dc6/Instalar%20Ansible%20en%20Windows.md))

---

## 🚀 Instrucciones de uso

### 📦 Opción 1: Despliegue local con Vagrant

```
vagrant up
```
Resultado: se genera /vagrant/partido.txt dentro de la VM con los datos del partido.

### 🐳 Opción 2: Despliegue con Docker Desktop
```
docker-compose up --build
```
El contenedor ejecutará el playbook y generará el archivo partido.txt.

### ☁️ Opción 3: Despliegue en AWS EC2
Lanza una instancia EC2 Ubuntu.

Transfiere el proyecto con scp o Git.

Ejecuta:
```
chmod +x scripts/aws_ec2_deploy.sh
./scripts/aws_ec2_deploy.sh
```

Este script instala Ansible y ejecuta automáticamente el playbook.

