#! /bin/bash

# We need to start php once, then stop it to avoid error of "instance of php already running..."
# when launching php for a not stopping command. 
chmod -R 755 /shared_data
chown www-data:www-data /shared_data
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F -R # -F: no daemonize; -R: run as root
