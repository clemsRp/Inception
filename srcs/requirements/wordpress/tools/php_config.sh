
# Create repertory if necessary
mkdir -p /run/php

# Wait mariadb database start
until mariadb-admin ping -h"mariadb" --silent; do
    echo "Waiting MariaDB..."
    sleep 1
done

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

	# Configuring Redis access in wp-config.php
	wp plugin install redis-cache \
		--activate \
		--allow-root \
		--path='/var/www/wordpress'

	wp config set WP_REDIS_HOST redis --allow-root --path='/var/www/wordpress'
	wp config set WP_REDIS_PORT 6379 --allow-root --path='/var/www/wordpress'
	wp config set WP_CACHE true --raw --allow-root --path='/var/www/wordpress'

	# Enabling the Redis cache via WP-CLI
	wp redis enable \
		--allow-root \
		--path='/var/www/wordpress'

fi

exec php-fpm7.4 -F
