#!/bin/bash
clear

# Preparacion de la Instalacion
###############################
# Actualizacion del Sistema
sudo apt update && sudo apt upgrade -y
# Instalacion de Herramientas de RED
sudo apt install net-tools
# Instalacion de Browser en consola
sudo apt install lynx


# Configuracion e Instalacion de Apache
# #####################################
# Instalacion de Apache
sudo apt update && sudo apt install apache2 -y
# Configuracion del Firewall
# Habilitar acceso al Firewall para SSH
sudo ufw allow OpenSSH
# Actualizar reglas de firewall para Apache
sudo ufw allow in "Apache Full"
# Habilitar el Firewall de Ubuntu
sudo ufw enable
# Si aparece el mensaje "Command may disrupt existing ssh connections" - presionar "Y"
# Chequear el estado general del firewall
sudo ufw status
# Testear el servicio de Apache
sudo service apache2 status
# Comando para conocer la IP de mi servidor
ip addr show wlp7s0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
# Probar que el servidor apache funciona correctamente en el navegador
lynx 127.0.0.1


#Configuracion e Instalacion de MySQL
#####################################
# Instalacion de MySQL
sudo apt update && sudo apt install mysql-server -y
# Testear el servicio de MySQL
sudo service mysql status
# Configurar Security en MySQL Server
sudo mysql_secure_installation

# Validate Password Component N (Enter)
# Crear la contraseña del root de MySQL: root
# Remove anonymous users ?  SI
# Deshabilitar Login remoto ? SI
# Eliminar las bases de datos Test ? SI
# Recargar los permisos de las tablas ahora ? SI

# Testear el servicio de MySQL (Acceder a la consola de MySQL)
sudo mysql
# si todo va bien, aparece la consola de MySQL. Escribir "exit" para salir

#Configuracion e instalacion de PHP
###################################
# Instalacion de CURL
sudo apt update && sudo apt install curl
#Instalacion de PHP
sudo apt update && sudo apt install php libapache2-mod-php php-mysql php-curl php-cli
#Testear la instalacion de PHP desde la consola
php -version

#Probar configuracion de PHP y Apache
sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

lynx 127.0.0.1/info.php





















