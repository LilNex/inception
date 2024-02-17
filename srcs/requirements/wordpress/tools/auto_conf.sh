#!/bin/bash

mkdir -p /run/php
mkdir -p /var/www/wordpress
wp core download --path=/var/www/wordpress --allow-root

cd /var/www/wordpress

wp config create	--allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

rm -f wp-config-sample.php

wp core install --url=$WP_URL --title=Inception --path='/var/www/wordpress' --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root
wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' --allow-root


php-fpm7.4 -F -R