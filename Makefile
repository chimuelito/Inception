launch:
	cd srcs && mkdir -p wp_volume && mkdir -p mariadb_volume && docker-compose up --build -d

clean:
	cd srcs && docker-compose down -v

fclean: clean
	docker system prune
	cd srcs && rm -rf wp_volume mariadb_volume
