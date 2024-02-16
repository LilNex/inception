from debian:bullseye

WORKDIR /app

RUN apt update -y && apt upgrade -y 


RUN apt install mariadb-server -y

# RUN mkdir -p /run/mysqld

RUN sed -i 's|# port =|port =|g' /etc/mysql/mariadb.cnf

RUN sed -i 's|socket =|#socket =|g' /etc/mysql/mariadb.cnf
RUN sed -i 's|127\.0.\0\.1|*|g' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/startup.sh /tmp/startup.sh


CMD ["bash", "/tmp/startup.sh"]