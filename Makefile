

up:
	docker compose -f ./srcs/docker-compose.yml up --build 

down:
	docker compose -f ./srcs/docker-compose.yml down 

re: down
	docker compose -f ./srcs/docker-compose.yml down -v
	rm -rf /root/data/database/*
	rm -rf /root/data/wordpress/*
	$(MAKE) up