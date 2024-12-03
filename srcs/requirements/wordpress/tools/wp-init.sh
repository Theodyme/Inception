#!/bin/sh

echo 1

mysqladmin -h mariadb -u "$DB_USR" --password="$DB_PWD" ping 2> /dev/null
while [ $? -ne 0 ]; do echo "[WP config] Waiting for database connection..."; sleep 1; mysqladmin -h mariadb -u "$DB_USR" --password="$DB_PWD"  ping 2> /dev/null; done;

echo 2 

if [ ! -e "/wordpress/wp-config.php" ]; then
	wp core download --allow-root

       	mv /wp-config.php ./wp-config.php
	envsubst '${DB_NAME} ${DB_USR} ${DB_PWD}' < /var/www/html/wp-config.php | sponge /var/www/html/wp-config.php

	wp core install --url="flplace.42.fr" \
			--title="Inception" \
			--admin_user=$WP_ADMIN_NAME \
			--admin_password=$WP_ADMIN_PWD \
			--admin_email=$WP_ADMIN_MAIL \
			--allow-root

	wp user create $WP_USR_NAME $WP_USR_MAIL \
			--role=subscriber \
			--user_pass=$WP_USR_PWD \
			--allow-root

	wp plugin activate wp-cfm
	wp config pull default
#	chmod +x /var/www/html/wp-config.php
fi

echo 3
echo 4

php-fpm7.4 -F

echo 5
