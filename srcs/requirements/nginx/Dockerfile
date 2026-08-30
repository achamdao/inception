FROM debian:12
RUN apt update &&  apt install -y nginx
COPY ./config.conf /etc/nginx/nginx.conf
COPY ./nginx-selfsigned.key /etc/nginx/signedkey.key
COPY  ./certafic.crt /etc/nginx/certafic.crt
COPY ./file.sh .
RUN  apt install -y curl
WORKDIR /WordPress
CMD sh /file.sh