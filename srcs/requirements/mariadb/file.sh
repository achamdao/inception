#!/bin/bash
export DBPASSWORD=$(cat /run/secrets/DBPASS)
couter=0

service mariadb start
while ! mysqladmin ping --silent ;do
    if [ $couter -eq 5 ]; then
        echo "Error: !!! in starting server mariadb !!!"
        exit 1
    fi
    couter=$((couter + 1))
    sleep 2
done
mariadb -u root <<o
CREATE USER $DBUSER IDENTIFIED BY '$DBPASSWORD';
GRANT ALL ON $DBNAME.* TO $DBUSER;
o

mariadb -u $DBUSER -p$DBPASSWORD <<o
CREATE DATABASE IF NOT EXISTS $DBNAME;

o
service mariadb stop

echo mariadb is ready ...
exec mariadbd --user=mysql