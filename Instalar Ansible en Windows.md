# Instalar Ansible en WSL (Ubuntu) en Windows 11
## 🧰 Requisitos previos
- Windows 10 o 11 actualizado
- Acceso a Internet
- Tener permisos de administrador (solo para el paso de instalación)

## Instalación
### 🪟 Paso 1: Instalar WSL con Ubuntu
Abre PowerShell como administrador y ejecuta:

```
wsl --install
```
Esto instalará WSL 2 con Ubuntu por defecto. Si ya tenías WSL, se actualizará.

🔁 Reinicia tu PC si te lo pide.

Luego abre "Ubuntu" desde el menú inicio. Espera unos minutos a que se configure y luego crea tu nombre de usuario y contraseña de Linux.

### 🐧 Paso 2: Actualizar Ubuntu en WSL
En la terminal de Ubuntu, ejecuta:

```
sudo apt update && sudo apt upgrade -y
```

### 📦 Paso 3: Instalar Ansible
Ejecuta:
```
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
```
### ✅ Paso 4: Verificar instalación
```
ansible --version
```
Deberías ver algo como:
```
ansible [core 2.x.x]
  config file = /etc/ansible/ansible.cfg
  ...
```
¡Y listo! Ya puedes usar Ansible desde Ubuntu WSL.
