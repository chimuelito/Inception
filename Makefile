UNAME=$(shell uname)

include ./srcs/.env

launch:
	mkdir -p $(VOLUMES_PATH)/$(WP_VOLUME_NAME) $(VOLUMES_PATH)/$(DB_VOLUME_NAME) \
		&& cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down -v

up:
	cd srcs && docker-compose up --d

reload: down up

ifeq ($(UNAME), Linux)
fclean: down
	docker system prune
	cd srcs && sudo rm -rf $(VOLUMES_PATH)/$(WP_VOLUME_NAME) $(VOLUMES_PATH)/$(DB_VOLUME_NAME)
else
fclean: down
	docker system prune
	cd srcs && rm -rf $(VOLUMES_PATH)/$(WP_VOLUME_NAME) $(VOLUMES_PATH)/$(DB_VOLUME_NAME)
endif

.PHONY: launch down fclean up down reload
