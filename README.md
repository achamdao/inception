This project has been created as part of the 42 curriculum by achamdao

# Description
The goal of this project is to practice and understand how the Docker platform works, how to manage containers, and what a container, image, Dockerfile, Docker Compose, and Docker network are. It also covers container isolation, and how to test and set up your app in a single container and across multiple containers

# Instructions
#### 1- install docker engine

    - https://docs.docker.com/engine/install/debian/

#### 2- cloning repository
    - write in your terminal git clone <repo>

#### 3- compilation
    - write in your terminal cd <repo> directory

    - write [make] command for create diroctory of storage of the volume , build images : mariadb ; wordpress ; nginx , run containers 

    - write [make clean] command if you want stop and remove containers and images 

    - write [make fclean] command if you want stop and remove containers and images and volumes and 
    mounted diroctory

    - write [make re] command for rebuild the project
#### 4- Access the Website

    - open your browser and write https://achamdao.42.fr/

    - if not work this URL go to /etc/hosts and add this:  127.0.1.1       achamdao.42.fr

    - enter login and password is found in this file secrets/WP_PASS_AD.env and user in .env file in root

# Resources
- https://docs.docker.com/get-started/
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
- https://www.cloudflare.com/learning/ssl/what-is-a-session-key/
- https://mariadb.com/docs/server/mariadb-quickstart-guides/basics-guide
- https://nginx.org/en/docs/http/configuring_https_servers.html
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html
- https://www.php.net/manual/en/install.fpm.php
- https://www.digitalocean.com/community/tutorials/php-fpm-nginx
- https://www.thatsgeeky.com/2012/02/directly-connecting-to-php-fpm/
- In this project, I used AI to explain documentation, correct my English, and translate text.
- https://thecontainerdbook.com/chapters/part-1/01-container-stack-map

# Project description
### Description
- **Using Docker:** I used Docker to set up the entire web infrastructure. This was achieved by creating three isolated containers that work together to host the database, process the backend, and serve the website securely.

- **Architecture & Design Choices:** 
    - **The First Container (MariaDB):** This container runs the database management server. It is configured to listen on port 3306 and bind to the `0.0.0.0` address. Inside this server, a dedicated user and database are created, and the MariaDB service runs as the main process (PID 1).
    - **The Second Container (WordPress / PHP-FPM):** PHP-FPM (FastCGI Process Manager) handles the backend execution. It creates worker processes that can run PHP code and outputs the result using the FastCGI protocol. It listens on port 9000, binds to `0.0.0.0`, and is configured via `php-fpm.conf`.
    - **The Third Container (NGINX):** NGINX acts as the primary web server. It directly serves static data (such as `.html`, `.css`, and `.js` files). However, it does not process dynamic languages like PHP directly; instead, it acts as a **Reverse Proxy**, redirecting PHP requests to the PHP-FPM container. It is configured using its custom configuration file.

- **Sources & Resources:** You can find the list of included sources and references at the bottom of this README ⬇️.
        
### 1- Virtual Machines vs Docker 
***Definition***
- Virtual machine : A Virtual Machine (VM) is an emulation of a real computer system that you can   run on your Host. It works like any other Software inside your host, but it functions as a complete virtual computer. It is isolated from your host system, and you can install any Operating System on it, such as Windows or Linux. It is managed by a technology called a Hypervisor, which manages and allocates resources between your virtual system and the physical Hardware.

- Docker : is an open platform for developers to test and manage their applications using isolated processes from the infrastructure, which are called Containers.

***Comparsion***
- resources
    - A Virtual Machine takes more resources because it installs a new Kernel and many dependencies that you don't need. On the other hand, a Docker Container shares the host's Kernel, and you only add the specific dependencies your application needs.
- Performance
    - Docker has higher performance than a Virtual Machine. Building and running a Container takes only a few seconds, whereas a Virtual Machine takes a lot of time to boot. Furthermore, you can run multiple Containers normally on your Host, but running multiple Virtual Machines requires massive hardware resources.

### 2 - Secrets vs Environment Variables

***Definition***

- Environment Variables: These are variables that can be set via the container running command, in a Dockerfile, or in a .yml file to inject data into the container's environment.

- Docker Secrets: This is a method to inject sensitive data into a Container. Unlike Environment Variables, this data is mounted as a file, typically located at ```/run/secrets/<secret_name>```. It is used to secure sensitive information such as passwords, API keys, and certificates.

***Comparsion***

- Docker Secrets are more secure than Environment Variables for injecting sensitive data because they hide the data. When using the ```docker inspect <container name> command```, all Environment Variables are exposed and visible. Conversely, Secrets are mounted as files and remain completely hidden from this command."

### 3 - Docker Network vs Host Network

- Docker Network : enables Containers to connect with the Host network, external devices, and other Containers. It provides the Container with an isolated network environment, separated from the Host, functioning just like a real device.

- Host Network: This network is not isolated from the Host. For example, if a Container opens port 80, it directly uses the host's port 80. Consequently, you cannot open this same port in another Container because it is already in use.

### 4 - Docker Volumes vs Bind Mounts

- Docker Volumes: This is a storage space created and managed by the Docker Daemon on your disk. You can link it to a single Container or share it among multiple Containers, and this is done by mounting it.

- Bind Mounts: This provides an alternate view of a directory. It links a host directory to a container and points to a specific resource; it simply creates a portal to access that existing directory without copying the data.
