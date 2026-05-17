
# Wait mariadb database start
sleep 10

# Get the database password
SQL_PASSWORD=$(cat ../../../../secrets/db_password.txt)

# Generate the wp-config.php file
wp config create \
	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

# Install the wordpress core and create the first user, defined previously in the wp-config.php
wp core install

# Create the second user in the database
wp user create
