#!/bin/bash
echo "---------------------------"
echo "Start process configuration"
echo ""

# Install tree command line
echo "Install tree command line"
sudo apt-get install tree
echo ""

# Install docker
echo "Install docker"
sudo apt install docker.io
docker --version
echo ""

# Install docker-compose
echo "Install docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-"$(uname -s)"-"$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo ""

# Install jq
echo "Install docker-compose"
sudo apt-get update
sudo apt-get install jq
echo '{"print":{"valle-magico":"success","status":"ok","test":"jq package"}}' | jq '.'
echo ""

# Remove old Valle Magico
sudo unlink /var/www/valle_laravel
echo ""

# Configure ports
echo "Configure ports"
sudo ufw allow 8070
sudo ufw allow 9091
sudo ufw allow 9092
echo ""

# Configure MySQL
echo "Configure MySQL"
echo "Login root MySQL"
mysql -u root -ps1r1yd1n32l
# Create user: valle-user
CREATE USER 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
# Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_magico;
GRANT ALL PRIVILEGES ON talentumehs_valle_magico.* TO 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
FLUSH PRIVILEGES;
# Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_open_location;
GRANT ALL PRIVILEGES ON talentumehs_valle_open_location.* TO 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
FLUSH PRIVILEGES;
Exit;
echo "Loading model database talentumehs_valle_magico"
mysql -u root -ps1r1yd1n32l talentumehs_valle_magico < docker/db/talentumehs_valle_magico.sql
mysql -u root -ps1r1yd1n32l talentumehs_valle_open_location < docker/db/talentumehs_valle_open_location.sql
echo ""

# Download updater Valle Magico
echo "Download updater Valle Magico"
folder="/repositories/"
if [ -d $folder ]; then
    cd "$folder" || exit
else
    mkdir $folder
fi
curl -o "$folder"docker-compose-update.sh https://raw.githubusercontent.com/jefedesarrollo/updater-nexum/main/docker-compose-update.sh
echo ""

echo "End process configuration"
echo "---------------------------"