FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl

RUN mkdir -p etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -nodes -days 365 \
			-keyout /etc/nginx/ssl/self-signed.key \
			-out /etc/nginx/ssl/self-signed.crt \
			-subj "/C=FR/ST=AURA/L=Lyon/O=42Lyon/OU=ncatrien/CN=ncatrien"

COPY default /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
