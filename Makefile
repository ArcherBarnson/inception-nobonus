all:	build
	docker compose -f srcs/docker-compose.yml up -d

build:	
	mkdir -p /home/bgrulois/data/mariadb
	mkdir -p /home/bgrulois/data/wordpress
	docker compose -f srcs/docker-compose.yml build

clean:	
	docker compose -f srcs/docker-compose.yml down -v

stop:
	docker compose -f srcs/docker-compose.yml stop

fclean: clean
	docker compose -f srcs/docker-compose.yml down --volumes
	docker system prune -af
	@sudo rm -rf /home/bgrulois/data

re:	fclean all
