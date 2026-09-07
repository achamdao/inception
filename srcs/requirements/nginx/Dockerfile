FROM debian:12
RUN apt update &&  apt install -y nginx
RUN  apt install -y curl
RUN  apt install -y openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt -subj "/C=MA/ST=darbida-stat/L=berrchid/O=achraf/CN=localhost" 
COPY ./config.conf /etc/nginx/nginx.conf
COPY ./file.sh .
WORKDIR /WordPress
ENTRYPOINT ["sh" ,"/file.sh"]