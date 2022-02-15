#! /bin/bash

CONF_FILE=/var/www/wordpress/wp-config.php

# We need to start php once, then stop it to avoid error of "instance of php already running..."
# when launching php for a not stopping command. 
if [[ -d wordpress ]]
then
	mv wordpress/* /var/www/wordpress
	rm -rf wordpress
	chmod -R 755 /var/www/wordpress
	chown www-data:www-data /var/www/wordpress

	sed -i "s/DB_NAME/$WP_DB_NAME/2" $CONF_FILE 
	sed -i "s/DB_USER/$WP_DB_USER/2" $CONF_FILE 
	sed -i "s/DB_PASSWORD/$MYSQL_PASSWORD/2" $CONF_FILE 
fi

service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F -R # -F: no daemonize; -R: run as root
