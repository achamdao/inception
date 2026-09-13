
export WPPASS_ADMIN=$(cat /run/secrets/WP_PASS_AD)
export WPPASSWORD=$(cat /run/secrets/WP_PASS_USER)
export DBPASSWORD=$(cat /run/secrets/DBPASS)
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf
chown -R www-data:www-data /WordPress
wb core download --allow-root
wb config create --dbname="$DBNAME" --dbuser="$DBUSER"  --dbpass="$DBPASSWORD" --dbhost="$DBHOST"  --allow-root
wb core install --url=$WPURL --admin_user=$WPUSER_ADMIN --admin_password=$WPPASS_ADMIN --admin_email=$WPEMAIL_ADMIN --title=$WPTITLE --allow-root
wb user create $WPUSER $WPEMAIL --role=$WPROLE --user_pass=$WPPASSWORD --allow-root
echo "wordpress run ...."

exec /usr/sbin/php-fpm8.2 -F