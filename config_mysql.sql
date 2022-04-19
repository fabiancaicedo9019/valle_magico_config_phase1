-- Create user: valle-user
CREATE USER 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
-- Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_magico;
GRANT ALL PRIVILEGES ON talentumehs_valle_magico.* TO 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
FLUSH PRIVILEGES;
-- Create database: talentumehs_valle_magico
CREATE DATABASE talentumehs_valle_open_location;
GRANT ALL PRIVILEGES ON talentumehs_valle_open_location.* TO 'valle-user'@'%' IDENTIFIED BY 'Inclusionvalle2022*';
FLUSH PRIVILEGES;