from debian:bullseye


RUN apt update -y && apt  upgrade -y \
    && apt install wget unzip php7.4 php7.4-fpm php7.4-mysqli php7.4-redis -y 

RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf 

COPY ./tools/auto_conf.sh /tmp/auto_conf.sh
RUN chmod +x /tmp/auto_conf.sh

EXPOSE 9000

CMD ["bash", "/tmp/auto_conf.sh"]
