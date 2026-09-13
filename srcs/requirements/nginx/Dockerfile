FROM debian:12
ARG FPM_PHPHOST=wordpress:9000
RUN apt update &&  apt install -y nginx
RUN  apt install -y openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt -subj "/C=MA/ST=darbida-stat/L=berrchid/O=achamdao/CN=achamdao.42.fr" 
RUN apt install -y procps
COPY ./config.conf /etc/nginx/nginx.conf
RUN sed -i "s@fastcgi_pass  FPM_PHPHOST;@fastcgi_pass $FPM_PHPHOST;@g" /etc/nginx/nginx.conf
WORKDIR /WordPress
ENTRYPOINT ["nginx","-g", "daemon off;"]
