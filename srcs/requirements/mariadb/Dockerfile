FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get install -y mariadb-server wget vim
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY setup.sh .

ARG WP_DB_NAME=$WP_DB_NAME
ARG WP_DB_HOST=$WP_DB_HOST
ARG WP_DB_USER=$WP_DB_USER
ARG MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ARG MYSQL_PASSWORD=$MYSQL_PASSWORD
COPY test_script.sh .
RUN bash test_script.sh

ENTRYPOINT ["mysqld"]
