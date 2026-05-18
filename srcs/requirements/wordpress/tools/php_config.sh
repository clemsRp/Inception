
# Wait mariadb database start
sleep 10

echo $WORDPRESS_DATABASE $WORDPRESS_PASSWORD $WORDPRESS_USER

# Generate the wp-config.php file
wp config create \
	--allow-root \
	--dbname=$WORDPRESS_DATABASE \
	--dbuser=$WORDPRESS_USER \
	--dbpass=$WORDPRESS_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress' \
	--allow-root

# Install the wordpress core and create the first user, defined previously in the wp-config.php
wp core install

# Create the second user in the database
wp user create
