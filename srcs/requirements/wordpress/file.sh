
wb core download --allow-root
sed -i "s#require __DIR__ . '/wp-blog-header.php';#require __DIR__ . '/wp-login.php';#g" index.php
rm -rf /wp-config.php
wb config create --dbname="$DBNAME" --dbuser="$DBUSER"  --dbpass="$DBPASSWORD" --dbhost="$DBHOST"  --allow-root
wb core install --url=$WPURL --admin_user=$WPUSER_ADMIN --admin_password=$WPPASS_ADMIN --admin_email=$WPEMAIL_ADMIN --title=$WPTITLE --allow-root
wb user create $WPUSER $WPEMAIL --role=$WPROLE --user_pass=$WPPASSWORD --allow-root
echo "wordpress run ...."

exec /usr/sbin/php-fpm8.2 -F