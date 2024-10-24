FROM debian:11

RUN apt-get update -y && \
    apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /docker-entrypoint-initdb.d/script.sh

EXPOSE 3306

VOLUME /var/lib/mysql

CMD ["mysqld"]
