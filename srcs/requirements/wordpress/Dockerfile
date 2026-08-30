FROM debian:12

RUN apt update &&  apt install -y  php-fpm wget  
RUN apt install php-mysql -y
COPY ./php-fpm.conf /etc/php/8.2/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN  touch /usr/local/bin/wb 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wb && apt install -y libfcgi-bin
COPY ./file.sh .
WORKDIR /WordPress

CMD ["sh", "/file.sh"]