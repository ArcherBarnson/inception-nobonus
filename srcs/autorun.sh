#!/bin/sh
#sudo -k # make sure to ask for password on next sudo ✱
if sudo true; then
	#build containers (duh)
	cd requirements/nginx && docker build -t nginx . && cd ../..
	sleep 15
	cd requirements/mariadb && docker build -t mariadb . && cd ../..
	sleep 15
	cd requirements/wordpress && docker build -t wp . && cd ../..
	sleep 15
	#run containers (very useful comments)
	docker run -d -p 8080:80 -it nginx
	sleep 15
	docker run -d --env="./.env" -it mariadb
	sleep 15
	docker run -d --env="./.env" -it wp 
	sleep 15
else
        echo "You are not sudo. Go away."
        exit 1
fi
