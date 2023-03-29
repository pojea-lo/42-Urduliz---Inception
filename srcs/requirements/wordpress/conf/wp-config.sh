mkdir -p /var/www/html/
chmod -R 755 /var/www/html/

while ! nc -z mariadb 3306; do
	echo "Esperando a que el contenedor 'db' esté disponible..."
	sleep 1
done

cd /var/www/html

wp core download --path=/var/www/html --allow-root

wp --path=/var/www/html config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root --skip-check

wp core install --path=/var/www/html --title="El inception de pojea-lo fuka" --url=https://pojea-lo.42.fr --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASSWORD} --admin_email=${WORDPRESS_EMAIL} --allow-root

wp --path=/var/www/html theme install https://downloads.wordpress.org/theme/writee.2.0.5.zip --allow-root
wp --path=/var/www/html theme activate writee --allow-root
