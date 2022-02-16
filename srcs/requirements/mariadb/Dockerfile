FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get install -y mariadb-server wget vim
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY setup.sh .

ENTRYPOINT ["bash", "setup.sh"]
