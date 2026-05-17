
FROM debian:bullseye

RUN apt update -y
RUN apt-get install mariadb-server ssh -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mysql_config.sh /mysql_config.sh
RUN chmod 777 /mysql_config.sh
ENTRYPOINT ["sh", "/mysql_config.sh"]
