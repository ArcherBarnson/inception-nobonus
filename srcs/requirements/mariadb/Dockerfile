FROM		debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN		apt-get install mariadb-server -y

COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY		./tools/db-conf.sh ./db-conf.sh

RUN		chmod +x ./db-conf.sh

EXPOSE		3306

ENTRYPOINT	["./db-conf.sh"]
