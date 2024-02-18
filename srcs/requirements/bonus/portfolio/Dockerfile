FROM debian:bullseye

RUN apt update && \
    apt install -y apache2

RUN rm -rf /var/www/html/index.html

COPY ./docs/index.html /var/www/html/index.html

CMD ["apache2ctl", "-D", "FOREGROUND"]
