#base image of debian 10 (buster)
FROM	debian:buster

#copy of the files needed for the container
COPY	./conf/init.sh	 	/tmp
COPY	./conf/sql_conf.sh	/tmp

#previous installation of necessary packages
RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	chmod +x /tmp/init.sh && \
	chmod +x /tmp/sql_conf.sh &&\
	/bin/bash -c /tmp/sql_conf.sh && \ 
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/*

#expose de 3306 port
EXPOSE	3306

#run the comand to create the init.sql file and use it to launch the server of mysql
CMD ["sh", "-c", "/tmp/init.sh > /tmp/init.sql && mysqld --init-file=/tmp/init.sql"]
