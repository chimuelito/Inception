UNAME=$(shell uname)

launch:
	cd srcs && mkdir -p wp_volume && mkdir -p mariadb_volume && docker-compose up --build -d

down:
	cd srcs && docker-compose down -v

ifeq ($(uname), Linux)
fclean: down
	docker system prune
	cd srcs && sudo rm -rf wp_volume mariadb_volume
else
fclean: down
	docker system prune
	cd srcs && rm -rf wp_volume mariadb_volume
endif

.PHONY: launch down fclean
