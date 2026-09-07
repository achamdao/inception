FROM debian:12

RUN apt update &&  apt install -y php8.2-fpm wget  
RUN apt install php-mysql -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN  touch /usr/local/bin/wb 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wb && apt install -y libfcgi-bin
COPY ./file.sh .
COPY ./php-fpm.conf /etc/php/8.2/fpm/pool.d/www.conf
WORKDIR /WordPress

ENTRYPOINT ["sh", "/file.sh"]
