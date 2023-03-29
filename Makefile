NAME = inception 
FILE = ./srcs/docker-compose.yml

up:
	docker-compose -f $(FILE) up -d --build

stop:
	docker-compose -f $(FILE) stop

start:
	docker-compose -f $(FILE) start

down:
	docker-compose -f $(FILE) down

clean:
	yes | docker system prune -a

fclean:
	sudo rm -rf /home/pojea-lo/data/md/* && sudo rm -rf /home/pojea-lo/data/wd/*

.PHONY: all stop down clean fclean
