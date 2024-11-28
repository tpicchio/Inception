#!/bin/sh

# Inizializzazione del database (se non è già stato fatto)
if [ ! -d "/var/lib/mysql/mysql" ]; then
    chown -R mysql:mysql /var/lib/mysql
    # Inizializzazione del database per MariaDB
    mysqld --user=mysql --initialize --basedir=/usr --datadir=/var/lib/mysql
fi

# Creazione del database e dell'utente (se non esistono già)
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    cat << EOF > /tmp/setup_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';

# Creazione del database 'inception_db' (modifica a seconda del nome che desideri)
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;

# Creazione dell'utente e concessione dei privilegi
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON inception_db.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
    # Esegui il file di script di inizializzazione
    /usr/bin/mysqld --user=mysql --bootstrap < /tmp/setup_db.sql
    rm -f /tmp/setup_db.sql
fi
