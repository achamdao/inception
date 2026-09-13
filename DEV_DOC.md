# Dev Documentation (Inception)

This document provides a simple guide for administrators to understand, deploy, and manage the web infrastructure.

## 1. Set up the environment from scratch (prerequisites, configuration files, secrets)
- Clone the repository by running the command: `git clone <repo>`, then navigate inside the project folder.
- Create a folder named `secrets` and add the following files inside it:
  - `DBPASS`: Inside this file, add the database password.
  - `WP_PASS_AD`: Inside this file, add the WordPress administrator password.
  - `WP_PASS_USER`: Inside this file, add the password for a standard WordPress user.
- Run the command: `sudo nano /etc/hosts`
  - Add this domain name mapping to the file: `127.0.0.1       achamdao.42.fr`

## 2. Build and launch the project using the Makefile and Docker Compose
- Install Docker Engine if it is not already installed: https://docs.docker.com/engine/install/debian/
- Run `make` to build images, run containers, and create networks and storage volumes.
- Run `make clean` to remove containers, images, and networks.
- Run `make fclean` to run clean and also remove storage volumes.
- Run `make re` to remove everything and restart the project.
- Run `sudo docker compose -f ./srcs/compose.yml up --build`
- Run `sudo docker compose -f ./srcs/compose.yml stop`
- Run `sudo docker compose -f ./srcs/compose.yml start`
## 3. Use relevant commands to manage the containers and volumes
- Use this command to create the folder where the WordPress database is stored:
  `sudo mkdir -p /home/achamdao/data/Wordpress_database`
- Use this command to create the folder where the WordPress website files are stored:
  `sudo mkdir -p /home/achamdao/data/Wordpress_files`
- Use this command to run the project (if not using make):
  `sudo docker compose -f ./srcs/compose.yml up --build`
- Use this command to check running containers:
  `sudo docker ps`
- Use this command to show all volumes:
  `sudo docker volume ls`
- Use this command to show all images:
  `sudo docker image ls`
- Use this command to show all networks:
  `sudo docker network ls`

## 4. Identify where the project data is stored and how it persists
- Use this command to show all volumes:
  `sudo docker volume ls`
- Use this command to show detailed information about a specific volume (replace `<volume_name>` with the actual name):
  `sudo docker volume inspect <volume_name>`
- **how it persists**
  - By default, data created inside a container is stored in its ephemeral writable layer, which is destroyed when the container is removed (not stopped). To solve this data loss
    problem, we use a Volume mounted to a directory inside the container. This ensures the data remains persistent and is never lost
