#!/bin/sh

uid=`stat -c '%u' /var/www`
usermod -u $uid www-data

service apache2 start
service mysql start
service postfix start