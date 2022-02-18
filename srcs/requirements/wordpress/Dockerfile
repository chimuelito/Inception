FROM debian:buster

EXPOSE 9000 3306

RUN apt-get update && apt-get install -y wget php7.3-fpm php php7.3-mysql vim
RUN wget https://fr.wordpress.org/wordpress-5.8.3-fr_FR.tar.gz
RUN mkdir -p /var/www/html
RUN tar -xzvf wordpress-5.8.3-fr_FR.tar.gz --directory /var/www/html/ && rm -rf wordpress-5.8.3-fr_FR.tar.gz 
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY wp-config.php /var/www/html/wordpress/
COPY setup.sh .
RUN chown -R www-data:www-data /var/www/html/wordpress

CMD ["bash", "setup.sh"]
