UNAME=$(shell uname)

launch:
	cd srcs && mkdir -p wp_volume && mkdir -p mariadb_volume && docker-compose up --build -d

down:
	cd srcs && docker-compose down -v

up:
	cd srcs && docker-compose up --d

reload: down up

ifeq ($(uname), Linux)
fclean: down
	docker system prune
	cd srcs && sudo rm -rf wp_volume mariadb_volume
else
fclean: down
	docker system prune
	cd srcs && rm -rf wp_volume mariadb_volume
endif

.PHONY: launch down fclean up down reload
