#!/bin/bash
clear
sudo apt update && sudo apt upgrade -y
cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs

clear
echo "NodeJS Instalado"
node -v
npm -v
#Esperar 30 segundos mientras lee..
sleep 30
clear

sudo apt install build-essential
clear
sudo rm -rf nodesource_setup.sh
clear
