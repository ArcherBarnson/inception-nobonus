FROM		debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN 		apt-get install php7.4 php7.4-fpm php7.4-mysql mariadb-client wget -y

RUN		wget https://wordpress.org/latest.tar.gz -P /var/www

RUN		cd /var/www && tar -xzf ./latest.tar.gz  && rm -rf ./latest.tar.gz

RUN		wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

RUN		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN		chmod 755 /var/www/wordpress

COPY		./tools/wp-autoconf.sh ./wp-autoconf.sh

RUN		chmod +x ./wp-autoconf.sh

COPY		./conf/www.conf etc/php/7.4/fpm/pool.d/www.conf

EXPOSE		9000

ENTRYPOINT	["./wp-autoconf.sh"]
