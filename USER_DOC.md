# User Documentation (Inception)

This document provides a simple guide for administrators to understand, deploy, and manage the web infrastructure.

## 1. Services Provided by the Stack
This project deploys a complete, isolated web infrastructure using Docker containers. The Stack includes three main services:
* **NGINX:** The web server acting as the entry point, configured to handle secure HTTPS connections.
* **WordPress:** The Content Management System (CMS) that serves the actual website.
* **MariaDB:** The database system used by WordPress to securely store all site data and users.

## 2. Starting and Stopping the Project
You can easily control the entire lifecycle of the project using the provided `Makefile`. Open your terminal in the project's root directory and use the following commands:
* **To Start:** Run `make`. This will automatically build the required images, set up the storage volumes, and start all containers in the background.
* **To Stop:** Run `make clean`. This command stops the containers and completely wipes all images, networks.
* **Full Reset:** Run `make fclean`. This command stops the containers and completely wipes all images, networks, and storage volumes.
* **Rebuild:** Rum `make re` .This command stops the containers and completely wipes all images, networks, and storage volumes. and start all containers in the background.
## 3. Access the website and the administration panel
Before accessing the site, ensure your local DNS is configured properly. You must add the following line to your `/etc/hosts` file (requires sudo privileges):
`127.0.1.1       achamdao.42.fr`

* **Website Access:** Open your web browser and write to `https://achamdao.42.fr/`

## 4. Locate and manage credentials
For security reasons, passwords and sensitive data are not hardcoded. They are injected into the containers upon startup:
Located in the file `.env` in `srcs` folder and `secrets` folder in the root directory.

## 5. Checking that Services are Running Correctly
If you need to verify the health of the containers or troubleshoot issues, use the following Docker commands:
* **View Active Services:** Run `docker ps`. You should see three containers running (nginx, wordpress, and mariadb).
* **Check Service Logs:** If the website is not loading, you can check the logs of a specific service by running `docker logs <container_name>` (e.g., `docker logs nginx`).