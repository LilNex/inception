FROM debian:bullseye


RUN apt update -y && apt upgrade -y \
    && apt install redis-server -y 

RUN sed -i 's|127\.0\.0\.1|0\.0\.0\.0|g' /etc/redis/redis.conf \
    && echo "maxmemory 128mb\nmaxmemory-policy allkeys-lru\n" >> /etc/redis/redis.conf

EXPOSE 6379

COPY ./tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

CMD [ "bash", "/tmp/start.sh" ]
