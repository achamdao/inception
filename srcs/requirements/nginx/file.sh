#!/bin/bash
sleep 50
echo "nginx running ..."

sed -i "s@fastcgi_pass  FPM_PHPHOST;@fastcgi_pass $FPM_PHPHOST;@g" /etc/nginx/nginx.conf


nginx -g "daemon off;"