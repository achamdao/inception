DOWN = sudo docker compose -f ./srcs/docker-compose.yml  down

run:
	@echo " ✔ create folders of the volumes ..."
	@sudo mkdir -p /home/achamdao/data/Wordpress_database /home/achamdao/data/Wordpress_files
	@echo " ✔ build and run the contaners ..."
	@sudo docker compose -f ./srcs/docker-compose.yml up --build
stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop
start:
	@sudo docker compose -f ./srcs/docker-compose.yml start
clean:
	@$(DOWN)
fclean:
	@$(DOWN) -v --rmi all
	@echo " ✔ remove  folders : 'Wordpress_database' 'Wordpress_files' ..."
	@sudo rm -rf /home/achamdao/data/Wordpress_database /home/achamdao/data/Wordpress_files
re: fclean run

