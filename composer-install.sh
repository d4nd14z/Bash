#!/bin/bash
clear
cd ~
sudo apt update && sudo apt upgrade -y
sudo apt install php-cli unzip
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
clear
composer
sleep 30
clear
#Descargar laravel y dejarlo disponible de forma global
composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc
