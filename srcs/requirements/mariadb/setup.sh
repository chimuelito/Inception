#! /bin/bash

service mysql start

apt-get -y install expect
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"n\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")
echo "$SECURE_MYSQL"
apt-get -y purge expect

# creating the database for wordpress
echo "CREATE DATABASE ${WP_DB_NAME};" | mysql -u root
echo "CREATE USER IF NOT EXISTS \"${WP_DB_USER}\"@\"%\";" | mysql -u root
echo "SET password FOR \"${WP_DB_USER}\"@\"%\" = password('${MYSQL_PASSWORD}');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO \"${WP_DB_USER}\"@\"%\" IDENTIFIED BY \"${MYSQL_PASSWORD}\";"| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

tail -f
