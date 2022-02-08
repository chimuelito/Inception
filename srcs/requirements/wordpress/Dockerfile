FROM debian:buster

RUN apt-get update && apt-get install -y wget php-fpm
RUN wget https://fr.wordpress.org/wordpress-5.9-fr_FR.tar.gz
RUN tar -xzvf wordpress-5.9-fr_FR.tar.gz && rm wordpress-5.9-fr_FR.tar.gz
RUN echo coucou >> zob.txt
CMD tail -f zob.txt
