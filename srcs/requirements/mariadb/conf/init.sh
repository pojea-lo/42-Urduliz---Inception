#create the db for wordpress
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

#create the pojea-lo user
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"
echo "FLUSH PRIVILEGES;"

#remove the root user to prevent db access without password
echo "DROP USER 'root'@'localhost';"

#create a new user with all permisses to replace root
echo "CREATE USER IF NOT EXISTS 'boss'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' WITH GRANT OPTION;"
echo "FLUSH PRIVILEGES;"
