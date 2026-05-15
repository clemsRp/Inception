
# Wait mariadb database start
sleep 10

# First user
wp config create \
	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

# Second user
wp core install
wp user create
