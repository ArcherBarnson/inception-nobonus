all:	build
	docker compose -f srcs/docker-compose.yml up

build:	
	[ ! -e /home/bgrulois/data ] && \
	mkdir -p /home/bgrulois/data/wordpress -m 666 \
	mkdir -p /home/bgrulois/data/mariadb -m 666 || true;
	docker compose -f srcs/docker-compose.yml build

clean:	
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -af
	rm -rf /home/bgrulois/data

re:	fclean all
