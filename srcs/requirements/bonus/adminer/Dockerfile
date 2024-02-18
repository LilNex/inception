FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y wget php php-mysql \
    && mkdir -p /var/www/html \
    && wget -O /var/www/html/adminer.php https://www.adminer.org/latest.php


CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/"]
