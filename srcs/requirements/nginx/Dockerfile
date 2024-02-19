from debian:bullseye

WORKDIR /app

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/ \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA"

RUN rm -f /etc/nginx/sites-enabled/default

COPY conf/site.conf /etc/nginx/sites-enabled/site.conf

RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]