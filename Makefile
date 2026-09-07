run:
	@echo " ✔ create folders of the volumes ..."
	@sudo mkdir -p /home/achamdao/data/Wordpress_database   
	@sudo mkdir -p /home/achamdao/data/Wordpress_files
	@echo " ✔ build and run the contaners ..."
	@sudo docker compose -f ./srcs/docker-compose.yml up --build
stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop
start:
	@sudo docker compose -f ./srcs/docker-compose.yml start
clean:
	@sudo docker compose -f ./srcs/docker-compose.yml  down -v
fclean: clean
	@echo " ✔ remove  folders : 'Wordpress_database' 'Wordpress_files' ..."
	@sudo rm -rf /home/achamdao/data/Wordpress_database  
	@sudo rm -rf /home/achamdao/data/Wordpress_files
re: fclean run

