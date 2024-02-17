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

wp core install --url=ismailchaiq.com --title=Example --path='/var/www/wordpress' --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --allow-root

php-fpm7.4 -F -R