
# Create repertory if necessary
mkdir -p /run/php

# Wait mariadb database start
sleep 10

# Get the wordpress variables
. /run/secrets/credentials

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download \
		--path='/var/www/wordpress' \
		--allow-root --force

	# Generate the wp-config.php file
	wp config create \
		--allow-root \
		--dbname=$WORDPRESS_DATABASE \
		--dbuser=$WORDPRESS_USER \
		--dbpass=$WORDPRESS_USER_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	# Install the wordpress core and create the first user, defined previously in the wp-config.php
	wp core install \
		--allow-root \
		--path='/var/www/wordpress' \
		--admin_user=$ADMIN_USER \
		--url=$COMMON_NAME \
		--title=$WEBSITE_NAME \
		--admin_email=$WORDPRESS_ADMIN_EMAIL

	# Create the second user in the database
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
	    --allow-root \
	    --path='/var/www/wordpress' \
	    --role=author \
	    --user_pass=$WORDPRESS_USER_PASSWORD
fi

exec php-fpm7.4 -F
