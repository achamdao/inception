#!/bin/bash
service mariadb start

sleep 3
mariadb -u root <<o
CREATE USER $DBUSER IDENTIFIED BY '$DBPASSWORD';
GRANT ALL ON *.* TO $DBUSER;
o

mariadb -u $DBUSER -p$DBPASSWORD <<o
CREATE DATABASE IF NOT EXISTS $DBNAME;

USE $DBNAME;
o
echo mariadb is ready ...
sleep infinity