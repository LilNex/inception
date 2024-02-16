from debian:bullseye

WORKDIR /app

RUN apt update -y && apt upgrade -y \
    && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/ \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA"

RUN rm -rf /etc/nginx/sites-enabled/default
# 
# RUN mkdir /html

COPY conf/site.conf /etc/nginx/sites-enabled/site.conf

RUN chmod 755 /var/www
RUN chown -R www-data:www-data /var/www



# CMD ["nginx", "-g", "daemon off;"]
CMD ["sleep", "1000000"]