
# service mariadb start;
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe


# Start Mysql
service mariadb start;
sleep 2.5

# Set database
mysql -e "CREATE DATABASE IF NOT EXISTS test;"
mysql -e "CREATE USER IF NOT EXISTS crappo@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON test.* TO crappo@'%' IDENTIFIED BY 'password';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -proot_password shutdown

exec mysqld_safe