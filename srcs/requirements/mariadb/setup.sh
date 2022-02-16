#! /bin/bash

service mysql start

SCRIPT_DB=script_db.sql

if [[ ! -d $SCRIPT_DB ]]
then
	echo "
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	flush privileges;
	GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
	CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	SET PASSWORD FOR 'root'@'%' = PASSWORD('${MYSQL_ROOT_PASSWORD}');
	GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
	CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	SET PASSWORD FOR '${WP_DB_USER}'@'%' = PASSWORD('${MYSQL_PASSWORD}');
	CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
	GRANT ALL ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
	flush privileges;
	" > $SCRIPT_DB

	cat $SCRIPT_DB | mysql -u root
fi

#service mysql stop
#mysqld
tail -f
