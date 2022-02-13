FROM debian:buster

RUN apt-get update && apt-get install -y wget php7.3-fpm php php7.3-mysql vim
RUN wget https://fr.wordpress.org/wordpress-5.9-fr_FR.tar.gz
RUN tar -xzvf wordpress-5.9-fr_FR.tar.gz && rm wordpress-5.9-fr_FR.tar.gz 
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY setup.sh .
CMD ["bash", "setup.sh"]
