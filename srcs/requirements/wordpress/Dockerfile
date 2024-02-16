from debian:bullseye

WORKDIR /app

RUN apt update -y && apt upgrade -y \
    && apt install wget apache2 php7.4 php7.4-fpm php7.4-mysqli -y 

RUN cd /tmp && wget -O wordpress.tar.gz https://fr.wordpress.org/latest-fr_FR.tar.gz \
    && tar -xf wordpress.tar.gz && mkdir -p /var/www/html \
    && cp -r wordpress/* /var/www/html

RUN sed -i 's/ServerName www\.example\.com/ServerName 0\.0\.0\.0/' /etc/apache2/sites-enabled/000-default.conf 

RUN  a2dismod mpm_prefork && a2enmod mpm_event \
    && a2enmod proxy proxy_fcgi && a2enconf php7.4-fpm && service apache2 restart





CMD ["sleep", "99999999"]