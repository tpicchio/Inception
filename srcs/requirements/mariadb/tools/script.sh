CREATE DATABASE IF NOT EXISTS inception_db;
CREATE USER IF NOT EXISTS 'tpicchio'@'%' IDENTIFIED BY 'pippo';
GRANT ALL PRIVILEGES ON inception_db.* TO 'tpicchio'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pippo';