FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh


EXPOSE 20 21

CMD [ "bash", "/tmp/start.sh" ]
