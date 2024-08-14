#!/bin/sh

echo "Stopping and clearing dockers"
sudo docker system prune -af
-sudo docker volume ls $(sudo docker volume ls -q) 2>/dev/null
echo "Destroying volumes"
sudo rm -rf ~/data/wordpress ~/data/mariadb
sudo docker compose down --volumes
mkdir ~/data/wordpress ~/data/mariadb
echo "Volumes reset"
