
# Start Mysql
service mariadb start;
sleep 2.5

# Get the database passwords
SQL_PASSWORD=$(cat ../../../../secrets/db_password.txt)
SQL_ROOT_PASSWORD=$(cat ../../../../secrets/db_root_password.txt)

# Set database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '\`${SQL_PASSWORD}\`';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '\`${SQL_PASSWORD}\`';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
