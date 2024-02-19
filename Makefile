

DB_DIR= ${HOME}/data/database
WP_DIR= ${HOME}/data/wordpress



up:
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	docker-compose -f ./srcs/docker-compose.yml up --build 

down:
	docker-compose -f ./srcs/docker-compose.yml down 
	
fclean:
	docker stop $(shell docker ps -qa)
	docker rm $(shell docker ps -qa)
	docker rmi -f $(shell docker images -qa)
	docker volume rm $(shell docker volume ls -q)
	docker network rm $(shell docker network ls -q) 2>/dev/null

clean: down
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf $(DB_DIR)/*
	sudo rm -rf $(WP_DIR)/*
	
re: down clean
	$(MAKE) up