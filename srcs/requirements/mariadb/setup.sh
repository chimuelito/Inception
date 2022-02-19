#! /bin/bash

service mysql start

SCRIPT_DB=script_db.sql

if [[ ! -d $SCRIPT_DB ]]
then
	echo "
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL ON *.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	flush privileges;
	" > $SCRIPT_DB

	mysql < $SCRIPT_DB
fi

#service mysql stop
#mysqld  ## doesn't work
tail -f
#mysql -u ${WP_DB_USER} ## doesn't work
