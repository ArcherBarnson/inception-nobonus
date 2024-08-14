FROM		debian:bullseye

#FROM		debian:buster

RUN		apt update -y && apt upgrade -y

RUN		apt install curl nginx openssl -y

RUN		mkdir /etc/nginx/ssl

RUN		mkdir /var/run/nginx

RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=bgrulois.42.fr/UID=bgrulois"

COPY		conf/nginx.conf etc/nginx/nginx.conf	

EXPOSE		443

RUN		chmod -R 755 /var/www/html

RUN		chown -R www-data:www-data /var/www/html

ENTRYPOINT	["nginx", "-g", "daemon off;"]
