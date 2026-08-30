run:
	@sudo docker compose -f ./srcs/compose.yml up --build 
clean:
	@sudo docker compose -f ./srcs/compose.yml  down -v
re: clean run