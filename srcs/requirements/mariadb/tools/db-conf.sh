#!/bin/sh

echo "Starting mariadb service..."

service mariadb start && echo "Mariadb UP"

sleep 10

mysqladmin -u root password ${SQL_ROOT_PASSWORD}

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" && echo "Creating DB"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && echo "user created\n"

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && echo "basic perms up\n"

mysql -e "FLUSH PRIVILEGES;" && echo "PRIVILEGES FLUSHED\n"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

#killall mysqld_safe
sleep 3

exec mysqld_safe
