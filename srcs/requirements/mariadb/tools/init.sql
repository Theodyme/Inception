USE mysql;
	
-- Supprimer les users par defaut au nom vide
DELETE FROM mysql.user WHERE User='';

-- Supprimer la db test installee par defaut ainsi que ses privileges
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';

-- Restreindre les privileges root aux connexions locales (localhost et loopback)
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

FLUSH PRIVILEGES;
	
-- Redefinir le pwd de root
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';

-- Creer la db
CREATE DATABASE IF NOT EXISTS ${SQL_NAME};

-- Creer l'utilisateur et accorder les permissions
CREATE USER IF NOT EXISTS '${SQL_USR}'@'localhost' IDENTIFIED BY '${SQL_PWD}';
GRANT ALL PRIVILEGES ON ${SQL_NAME}.* TO '${SQL_USR}'@'%' IDENTIFIED BY '${SQL_PWD}';

-- Update privileges
FLUSH PRIVILEGES;
