#! /bin/bash

CONF_FILE=/var/www/html/wordpress/wp-config.php

service php7.3-fpm start
cd /var/www/html/wordpress/
# We need to start php once, then stop it to avoid error of "instance of php already running..."
# when launching php for a not stopping command. 
#chmod -R 755 /var/www/html/wordpress
rm wp-config-sample.php

sed -i "s/DB_NAME/$WP_DB_NAME/2" $CONF_FILE 
sed -i "s/DB_USER/$WP_DB_USER/2" $CONF_FILE 
sed -i "s/DB_PASSWORD/$MYSQL_PASSWORD/2" $CONF_FILE 

wp core install --url=localhost --title=SuperWebsite --admin_user=superman --admin_password=superman --admin_email=super@man.com --skip-email --allow-root
wp user create bob bob@mail.com --role=author --user_pass=bob --allow-root 

#service php7.3-fpm restart
#php-fpm7.3 -F -R # -F: no daemonize; -R: run as root
tail -f
