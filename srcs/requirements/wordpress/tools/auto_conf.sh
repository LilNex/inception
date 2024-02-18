#!/bin/bash

mkdir -p /run/php
mkdir -p /var/www/wordpress

cd /var/www/wordpress

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    echo "Creating wp-config.php"
    wp core download --path=/var/www/wordpress --allow-root
    wp config create	--allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
    wp config set WP_CACHE true --type=constant --allow-root --path='/var/www/wordpress'
    wp config set WP_REDIS_HOST redis --type=constant --allow-root --path='/var/www/wordpress'
    wp config set WP_REDIS_PORT 6379 --type=constant --allow-root --path='/var/www/wordpress'
    wp config set WP_REDIS_DISABLE_DROPIN_CHECK true --type=constant --allow-root --path='/var/www/wordpress'


    rm -f wp-config-sample.php

    wp core install --url=$WP_URL --title=Inception --path='/var/www/wordpress' --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root
    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' --allow-root

    wget https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip
    unzip redis-cache.latest-stable.zip
    mv redis-cache /var/www/wordpress/wp-content/plugins/
    wp plugin activate redis-cache --path=/var/www/wordpress/ --allow-root
    wp redis enable --path=/var/www/wordpress/ --allow-root

    chown -R www-data:www-data /var/www/wordpress

fi

php-fpm7.4 -F -R