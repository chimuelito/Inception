#! /bin/bash

# We need to start php once, then stop it to avoid error of "instance of php already running..."
# when launching php for a not stopping command. 
mv wordpress/* /var/www/wordpress
rm -rf wordpress
chmod -R 755 /var/www/wordpress
chown www-data:www-data /var/www/wordpress
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F -R # -F: no daemonize; -R: run as root
