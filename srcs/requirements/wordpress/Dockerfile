from debian:bullseye


RUN apt update -y && apt upgrade -y \
    && apt install wget php7.4 php7.4-fpm php7.4-mysqli -y 

RUN cd /tmp && wget -O wordpress.tar.gz https://fr.wordpress.org/latest-fr_FR.tar.gz \
    && tar -xf wordpress.tar.gz && mkdir -p /var/www/ \
    && cp -r wordpress/* /var/www/ && cd /var/www/

WORKDIR /var/www/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf 

# RUN 
# RUN  a2dismod php7.4 && a2dismod mpm_prefork && a2enmod mpm_event \
#     && a2enmod proxy proxy_fcgi && a2enconf php7.4-fpm && service apache2 restart

# Add this to apache2.conf

# <FilesMatch \.php$>
#     SetHandler application/x-httpd-php
# </FilesMatch>

# RUN php-fpm7.4 -R
EXPOSE 9000

# CMD ["service", "apache2", "restart"]
# CMD ["php-fpm7.4", "-R"]
CMD ["sleep", "1000000"]
