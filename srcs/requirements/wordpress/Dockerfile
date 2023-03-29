#base image of debian 10 (buster)
FROM	debian:buster

#copy of the files needed for the container
COPY	/conf/wp-cli.phar 	/usr/local/bin/wp
COPY	/conf/wp-config.sh	/tmp

#previous installation of necessary packages
RUN	apt-get update && \
	apt-get install -y curl wget netcat tar && \
	apt-get install -y php php-fpm php-mysql php-gd php-xml php-curl && \
	mkdir -p /var/www/html && \
	chmod -R 755 /var/www/html && \
	chmod +x /tmp/wp-config.sh

COPY	./conf/www.conf 	/etc/php/7.3/fpm/pool.d/
	
RUN 	sed -i 's/^pid = \/run\/php\/php7\.3-fpm\.pid$/pid = \/var\/run\/php-fpm7.3.pid/' /etc/php/7.3/fpm/php-fpm.conf

EXPOSE	9000

CMD ["sh", "-c", "./tmp/wp-config.sh && /usr/sbin/php-fpm7.3 -F"]
