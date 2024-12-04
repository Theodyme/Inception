all:
	@mkdir -p /home/flplace/data/mariadb /home/flplace/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker system prune -a --volumes -f
	docker volume rm $$(docker volume ls -q)
	rm -rf /home/flplace/data/mariadb/*
	rm -rf /home/flplace/data/wordpress/*


.PHONY: all down clean
