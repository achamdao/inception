FROM debian:12
WORKDIR /MariaDB
RUN apt update &&  apt install -y mariadb-server mariadb-client
COPY ./maria.cnf /etc/mysql/mariadb.cnf
COPY ./file.sh .

ENTRYPOINT ["sh", "file.sh"]