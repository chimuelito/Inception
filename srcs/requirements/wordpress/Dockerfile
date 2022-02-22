FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y wget php-fpm php-mysql php-cli vim
RUN mkdir -p /var/www/html
RUN wget https://fr.wordpress.org/wordpress-5.8.3-fr_FR.tar.gz && tar -xzvf wordpress-5.8.3-fr_FR.tar.gz --directory /var/www/html/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar&& chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY wp-config.php /var/www/html/wordpress/
COPY setup.sh .
RUN chown -R www-data:www-data /var/www/html/wordpress

CMD ["bash", "setup.sh"]
