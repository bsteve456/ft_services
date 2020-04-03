#! /bin/sh

mv /usr/share/wordpress/* /var/www/localhost/htdocs/wordpress/
#mysql -h mysql -u root -ppassword -e 'CREATE DATABASE IF NOT EXISTS wordpress';
#mysql -h mysql -u root -ppassword -e 'CREATE DATABASE IF NOT EXISTS wordpress';
rc-service php-fpm7 start
tail -f /dev/null
