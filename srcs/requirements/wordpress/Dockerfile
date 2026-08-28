FROM debian:12

RUN apt update &&  apt install -y  php-fpm wget  sendmail
RUN apt install php-mysqli -y
COPY ./php-fpm.conf /etc/php/8.2/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN  touch /usr/local/bin/wb 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wb
WORKDIR /WordPress
COPY ./file.sh .

CMD ["sh", "./file.sh"]