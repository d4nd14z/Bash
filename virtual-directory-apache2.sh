#!/bin/bash
clear

#Crear directorios para sitios web en apache
sudo mkdir /var/www/html/d2studios.com
sudo mkdir /var/www/html/devlab.com

#cambiar permisos de archivos
sudo chown -R d4nd14z:d4nd14z /var/www/html/d2studios.com
sudo chown -R d4nd14z:d4nd14z /var/www/html/devlab.com

#Crear archivos de prueba en cada directorio
sudo echo "<?php echo \"<h1>D2Studios.Com</h1>\"; ?>" >> /var/www/html/d2studios.com/index.php
sudo echo "<?php echo \"<h1>DEVLab.Com</h1>\"; ?>" >> /var/www/html/devlab.com/index.php

#Modificar archivo hosts para direccionar los sitios a 127.0.0.1
sudo gedit /etc/hosts
# Agregar lineas: 
# 127.0.0.1	d2studios.com
# 127.0.0.1	devlab.com

#Modificar configuracion de apache para crear directorios virtuales
cd /etc/apache2/sites-available
#CRear archivos para directorio virtuales (No olvidar crear los archivos con la extension *.conf
sudo echo -e "<VirtualHost *:80>\nDocumentRoot /var/www/html/d2studios.com\nServerName www.d2studios.com\nServerAlias d2studios.com\n</VirtualHost>" >> /etc/apache2/sites-available/d2studios.com.conf
sudo echo -e "<VirtualHost *:80>\nDocumentRoot /var/www/html/devlab.com\nServerName www.devlab.com\nServerAlias devlab.com\n</VirtualHost>" >> /etc/apache2/sites-available/devlab.com.conf

#Habilitar los directorios virtuales en apache
sudo a2ensite d2studios.com
sudo a2ensite devlab.com

#Reiniciar el servidor apache
sudo systemctl reload apache2

clear

echo "LISTO !"




