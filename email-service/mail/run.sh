#!/bin/sh

# create mysql runtime directory exists
mkdir -p /run/mysqld && touch /run/mysqld/softlevel
mkdir -p /var/mail/vhosts
chown -R postfix:postfix /var/mail/vhosts

# init mysql database
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# change configuration in /etc/my.cnf to run as root and bind to 127.0.0.1
sed -i '/\[mysqld\]/a user = root\nbind-address = 127.0.0.1' /etc/my.cnf

# start mysql daemon
mysqld &

# wait until mysql is ready to accept connections
until mysqladmin ping --silent; do
    sleep 1
done

# set root password before securing installation
mysqladmin -u root password 'toor'

# run the script: https://wiki.alpinelinux.org/wiki/MySQL#Initialization_2
mysql_secure_installation <<EOF

n
n
Y
Y
Y
Y
EOF

# check if mysql enforces password authentication for root. Still not sure if this
# is working correctly because I am still able to login to the mysql client without
# a proper password...
mysql -u root -p'toor' <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'toor';
FLUSH PRIVILEGES;
EOF

# create the database and users table
mysql -u root -p'toor' <<EOF
CREATE DATABASE IF NOT EXISTS emails;
USE emails;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    domain VARCHAR(255) NOT NULL,
    maildir VARCHAR(255) NOT NULL
);
EOF

# insert a test email user and actual users as needed.
mysql -u root -p'toor' <<EOF
USE emails;
INSERT INTO users (email, domain, maildir) VALUES
('user@example.com', 'example.com', 'example.com/user/');
EOF

# postfix must be started in the foreground for the container
# to stay running.
postfix start-fg

