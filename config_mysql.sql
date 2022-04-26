-- Create user: valle-user
CREATE USER 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
-- Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_magico;
-- Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_open_location;
GRANT ALL PRIVILEGES ON *.* TO 'valle-user'@'%';
FLUSH PRIVILEGES;