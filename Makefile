
DOCKER_COMPOSE_PATH = srcs/docker-compose.yml

prep:
	@sudo mkdir -p /home/crappo/data/mariadb
	@sudo mkdir -p /home/crappo/data/wordpress
	@sudo mkdir -p /home/crappo/data/ssl

down:
	docker compose -f $(DOCKER_COMPOSE_PATH) down -v
	$(MAKE) prep

down_no_cache:
	docker compose -f $(DOCKER_COMPOSE_PATH) down -v
	sudo rm -rf /home/crappo/data/mariadb/*         
	sudo rm -rf /home/crappo/data/wordpress/*
	sudo rm -rf /home/crappo/data/ssl/*
	$(MAKE) prep

build:
	docker compose -f srcs/docker-compose.yml build

build_no_cache:
	docker compose -f srcs/docker-compose.yml build --no-cache

up:
	docker compose -f srcs/docker-compose.yml up

launch:
	$(MAKE) down
	$(MAKE) build
	$(MAKE) up

launch_no_cache:
	$(MAKE) down_no_cache
	$(MAKE) build_no_cache
	$(MAKE) up

.PHONY: prep down down_no_cache build build_no_cache up launch launch_no_cache
