chown -R mysql /var/lib/mysql

# Comment the IP direction line to take the 0.0.0.0 by default
sed -i "s/^bind-address\s*=.*$/#bind-address = 127.0.0.1/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/skip-networking/#skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Uncomment the port line 3306
sed -i "s/#\?port\s*=.*/port=3306/" /etc/mysql/mariadb.conf.d/50-server.cnf

chmod +x /tmp/init.sh

service mysql restart
