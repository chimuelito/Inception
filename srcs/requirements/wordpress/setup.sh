#! /bin/bash

CONF_FILE=/var/www/html/wordpress/wp-config.php

service php7.3-fpm start
if [[  -f /var/www/html/wordpress/wp-config-sample.php ]]
then
	cd /var/www/html/wordpress/
	rm wp-config-sample.php

	sed -i "s/DB_NAME/$WP_DB_NAME/2" $CONF_FILE 
	sed -i "s/DB_USER/$WP_DB_USER/2" $CONF_FILE 
	sed -i "s/DB_PASSWORD/$MYSQL_PASSWORD/2" $CONF_FILE 

	wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_MAIL --skip-email --allow-root
	wp user create $USER_NAME $USER_MAIL --role=author --user_pass=$USER_PASS --allow-root 
fi

service php7.3-fpm stop
php-fpm7.3 -F -R # -F: no daemonize; -R: run as root
