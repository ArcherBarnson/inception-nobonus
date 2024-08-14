all:
	mkdir -p /home/bgrulois/data/wordpress
	mkdir -p /home/bgrulois/data/mariadb
	sudo docker compose up --build

clean:
	sudo rm -rf /home/bgrulois/data

fclean:	down clean
	sudo docker system prune -af --volumes

up:
	sudo docker compose up

down:
	sudo docker compose down

re:	fclean all
