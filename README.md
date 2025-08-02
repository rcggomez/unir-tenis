# 🎾 Generador Automático de Partidos de Tenis | Ansible + Vagrant + Docker + AWS

Este proyecto automatiza la creación de un archivo con la información de un partido de tenis entre dos jugadores, usando **Ansible** y **Vagrant**. Adicionalmente, el despliegue está preparado para funcionar también en **Docker Desktop** y **AWS EC2**, lo cual permite practicar la portabilidad de automatizaciones en distintos entornos.

---

## 🎯 Objetivos  

✔️ Automatizar la generación de un partido de tenis con datos de dos jugadores.  
✔️ Practicar **playbooks**, **roles**, **variables** y módulos de Ansible en entornos multiplataforma.  
✔️ Ejecutar la solución en local (Vagrant), contenedores (Docker) y nube (AWS EC2). 

---

## 🖥️ Tecnologías utilizadas

| Tecnología | Descripción |  
|------------|-------------|  
| [Ansible](https://www.ansible.com/) | Automatización de la generación del partido. |  
| [Vagrant](https://www.vagrantup.com/) | Creación de entornos virtuales locales. |
| [VirtualBox](https://www.virtualbox.org/) | Creación de entornos virtuales locales. | 
| [Docker](https://www.docker.com/)| Usar contenedor para la app |
| [AWS EC2](https://aws.amazon.com/ec2/) | Despliegue en la nube. |
| [https://randomuser.me/](https://randomuser.me/api/) | API pública |

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

- **Local (Vagrant)**:  
  - VirtualBox ≥ 6.0  
  - Vagrant ≥ 2.3  
- **Docker**:  
  - Docker Desktop ≥ 4.0  
- **AWS**:  
  - Clave PEM de EC2  
  - AWS CLI configurada (opcional)
- **Ansible**:
  - ([Instalar Ansible en Windows 11](https://github.com/rcggomez/unir-tenis/blob/41073608e0a1ed694261099166847dc4ea935dc6/Instalar%20Ansible%20en%20Windows.md))

---

## 🚀 Cómo Usar en local

### 1️⃣ Clonar el Repositorio 
```
mkdir <nombre de carpeta>                                # Crear localmente una carpeta en donde se almacenara el repositorio clonado
cd <nombre de carpeta>                                   # ingresar a la carpeta 
git clone https://github.com/rcggomez/unir-tenis.git     # Clonar repositorio
cd unir-tenis 
```

### 2️⃣ Ejecutar en Vagrant (Local)

```
vagrant up  # Inicia VM y ejecuta Ansible  
vagrant ssh # Opcional: Acceder a la VM  
```
Nota: El archivo partido.txt se genera en /vagrant/.

### 3️⃣ Ejecutar en Docker
```
docker-compose up --build
```
El contenedor ejecutará el playbook y generará el archivo partido.txt.

## ☁️ Como usar en AWS EC2

📌 Requisitos previos
Cuenta AWS activa con permisos para lanzar instancias EC2.
- Clave SSH (.pem) descargada y guardada en ~/.ssh/ (ej: unir-tenis-key.pem).
---
## 🚀 Pasos para ejecutar el proyecto en EC2
### 1️⃣ Lanzar una instancia EC2 Ubuntu
- AMI recomendada: Ubuntu Server 22.04 LTS (HVM).
  - Tipo de instancia: t2.micro (gratis en capa free tier).
  - Configuración clave:
    -Asegúrate de asignar un grupo de seguridad que permita:
      - SSH (puerto 22) desde tu IP.
      - Acceso HTTP/HTTPS si es necesario.
  - Selecciona tu par de claves (.pem) al crear la instancia.

### 2️⃣ Conectarse a la instancia vía SSH

```
chmod 400 ~/.ssh/unir-tenis-key.pem  # Asegurar permisos de la clave
ssh -i ~/.ssh/unir-tenis-key.pem ubuntu@<IP_PUBLICA_EC2>
```

### 3️⃣ Clonar el repositorio en la instancia

```
# Instalar Git si no está presente
sudo apt update && sudo apt install -y git

# Clonar el proyecto
git clone https://github.com/rcggomez/unir-tenis.git
cd unir-tenis
```

### 4️⃣ Ejecutar el script de despliegue automático

```
# Dar permisos de ejecución y correr el script
chmod +x scripts/aws_ec2_deploy.sh
./scripts/aws_ec2_deploy.sh
```

### 5️⃣ Verificar el archivo generado

```
cat partido.txt  # Mostrará el resultado del partido
```



