
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp_config.sh /usr/local/bin/ftp_config.sh
RUN chmod +x /usr/local/bin/ftp_config.sh

EXPOSE 21

ENTRYPOINT ["ftp_config.sh"]
