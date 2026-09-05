This project has been created as part of the 42 curriculum by achamdao

# Description
The goal of this project is to practice and understand how the Docker platform works, how to manage containers, and what a container, image, Dockerfile, Docker Compose, and Docker network are. It also covers container isolation, and how to test and set up your app in a single container and across multiple containers
### 1- Virtual Machines vs Docker 
*** Definition ***
- Virtual machine : A Virtual Machine (VM) is an emulation of a real computer system that you can   run on your Host. It works like any other Software inside your host, but it functions as a complete virtual computer. It is isolated from your host system, and you can install any Operating System on it, such as Windows or Linux. It is managed by a technology called a Hypervisor, which manages and allocates resources between your virtual system and the physical Hardware.

- Docker : is an open platform for developers to test and manage their applications using isolated processes from the infrastructure, which are called Containers.

*** Comparsion ***
- resources
    - A Virtual Machine takes more resources because it installs a new Kernel and many dependencies that you don't need. On the other hand, a Docker Container shares the host's Kernel, and you only add the specific dependencies your application needs.
- Performance
    - Docker has higher performance than a Virtual Machine. Building and running a Container takes only a few seconds, whereas a Virtual Machine takes a lot of time to boot. Furthermore, you can run multiple Containers normally on your Host, but running multiple Virtual Machines requires massive hardware resources.

### 2 - Secrets vs Environment Variables

### 3 - Docker Network vs Host Network

### 4 - Docker Volumes vs Bind Mounts

# Instructions

# Usage

# Resources
- https://docs.docker.com/get-started/
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
- https://www.cloudflare.com/learning/ssl/what-is-a-session-key/
- https://mariadb.com/docs/server/mariadb-quickstart-guides/basics-guide
- https://nginx.org/en/docs/http/configuring_https_servers.html
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html
- https://www.php.net/manual/en/install.fpm.php
- https://www.digitalocean.com/community/tutorials/php-fpm-nginx