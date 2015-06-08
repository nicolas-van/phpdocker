#!/bin/bash

apt-get update

# some default configuration to prevent mysql to ask for it
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections

DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential apache2 php5-gd php5-sqlite php5 php5-cli php5-mysql mysql-server php-db php-pear php5-mcrypt

pecl install uploadprogress
echo "extension=uploadprogress.so" > /etc/php5/apache2/conf.d/uploadprogress.ini
cp /root/setup/000-default.conf /etc/apache2/sites-available/000-default.conf
chown root:root /etc/apache2/sites-available/000-default.conf
cp /root/setup/apache2.conf /etc/apache2/apache2.conf
chown root:root /etc/apache2/apache2.conf
cp /root/setup/php.ini /etc/php5/apache2/php.ini
chown root:root /etc/php5/apache2/php.ini
cp /root/setup/mpm_prefork.conf /etc/apache2/mods-available/mpm_prefork.conf
chown root:root /etc/apache2/mods-available/mpm_prefork.conf
a2enmod rewrite
php5enmod mcrypt

mkdir /etc/my_init.d
cp /root/setup/init_container.sh /etc/my_init.d/init_container.sh
chown root:root /etc/my_init.d/init_container.sh

service mysql start

# some default database for mysql
mysql -uroot -proot -e "create database if not exists defaultdb"

DEBIAN_FRONTEND=noninteractive apt-get install -y postfix
DEBIAN_FRONTEND=noninteractive apt-get install -y mailutils

