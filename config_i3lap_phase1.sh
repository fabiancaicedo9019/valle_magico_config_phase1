#!/bin/bash
echo "---------------------------"
echo "Start process configuration"
echo ""

# Install tree command line
echo "Install tree command line"
sudo apt-get install tree
echo ""

# Install curl
echo "Install curl"
sudo apt-get install curl -y
echo ""

# Install docker
echo "Install docker"
sudo apt install docker.io -y
docker --version
echo ""

# Install docker-compose
echo "Install docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-"$(uname -s)"-"$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo ""

# Install jq
echo "Install jq"
sudo apt-get update
sudo apt-get install jq -y
echo '{"print":{"valle-magico":"success","status":"ok","test":"jq package"}}' | jq '.'
echo ""

# Remove old Valle Magico
sudo unlink /var/www/valle_laravel
echo ""

# Configure ports
echo "Configure ports"
echo "Allow port 8070"
sudo ufw allow 8070
echo "Allow port 9091"
sudo ufw allow 9091
echo "Allow port 9092"
sudo ufw allow 9092
echo ""

# Configure MySQL
echo "Configure MySQL"
echo "Execute configuration script in MySQL"
mysql -u root -ps1r1yd1n32l -e "source config_mysql.sql"
echo "Loading model database talentumehs_valle_magico"
mysql -u root -ps1r1yd1n32l talentumehs_valle_magico < db/talentumehs_valle_magico.sql
echo "Loading model database talentumehs_valle_open_location"
mysql -u root -ps1r1yd1n32l talentumehs_valle_open_location < db/talentumehs_valle_open_location.sql
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

# Run docker-compose-update.sh
echo "Run docker-compose-update.sh"
. "$folder"docker-compose-update.sh

echo "End process configuration"
echo "---------------------------"