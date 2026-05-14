
FROM debian:bullseye

RUN apt update -y
RUN apt-get install mariadb-server ssh -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mysql.sh /mysql.sh
RUN chmod 777 /mysql.sh
ENTRYPOINT ["sh", "/mysql.sh"]
