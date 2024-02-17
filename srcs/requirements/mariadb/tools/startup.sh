
service mariadb start

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    mysql -u root -e "FLUSH PRIVILEGES;" -p "${SQL_ROOT_PASSWORD}"
fi

mysqladmin shutdown -p ${SQL_ROOT_PASSWORD}
exec mysqld --user=mysql

