all:
	bash srcs/requirements/wordpress/tools/setup_dir.sh
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down all

clean: down
	docker system prune -a
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*

.PHONY	: all down re clean fclean