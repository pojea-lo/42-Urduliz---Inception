#base image of debian 10 (buster)
FROM	debian:buster

#previous installation of necessary packages
RUN	apt-get update && \
	apt-get install -y openssl && \
	apt-get install -y nginx

#copy of the files needed for the container
COPY	./tools/ssl/nginx.key	/etc/ssl/private
COPY	./tools/ssl/nginx.crt	/etc/ssl/certs
COPY	./conf/self-signed.conf	/etc/nginx/snippets
COPY	./conf/nginx.conf	/etc/nginx/sites-available/default

#we gona connect by the port 443 (https)
EXPOSE	443	

#run the comand to launch nginx to the foreground (daemond off)
CMD	["nginx", "-g", "daemon off;"]
