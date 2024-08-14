#!/bin/sh

sleep 35

if [ -e /var/www/wordpress/wp-config-sample.php ]; then

echo "wp-config.php not found : building now..."
#generate cfg file
#wp config create	--dbname=$SQL_DATABASE \
#			--dbuser=$SQL_USER \
#			--dbpass=$SQL_PASSWORD \
#			--dbhost="mariadb:3306" \
#			--path='/var/www/wordpress' \
#			--allow-root

#setting up wp admin user

#cat /var/www/wordpress/wp-config-sample.php

sed -i "s/database_name_here/$SQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/username_here/$SQL_USER/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/localhost/$SQL_HOST/g" /var/www/wordpress/wp-config-sample.php
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
rm /var/www/wordpress/wp-config-sample.php

#default config setup (i think)
wp core install --allow-root --url=bgrulois.42.fr --title=bgrulois_inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --skip-email --path='/var/www/wordpress'

#adding normal user 1
wp user create --allow-root $WP_USER1 $WP_USER1_EMAIL --role=author --user_pass=$WP_USER1_PW --path='/var/www/wordpress'


echo "Installation over, config file ---> "
cat /var/www/wordpress/wp-config.php
sleep 3

fi

if [ ! -e /run/php ]; then 
mkdir -p /run/php
fi

echo "Launching php fpm..."

if [ -e /etc/php/7.4/fpm/pool.d/www.conf ]; then
echo "www.conf EXISTS"
fi
/usr/sbin/php-fpm7.4 -F
