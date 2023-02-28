FROM	debian:buster

RUN		apt -y update
RUN		apt -y install nginx

COPY	./html/index.html /var/www/html/index.nginx-debian.html

EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]
