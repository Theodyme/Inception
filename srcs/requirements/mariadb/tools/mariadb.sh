#!/bin/sh

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

if [ ! -d "/run/mysqld" ]; then
	echo "[DB config] Granting MariaDB daemon run permissions..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

echo "checking"

if [ ! -d "/var/lib/mysql/mysql" ]
then
	echo "Mariadb already configured."
else
	echo "[DB config] Launching configuration script..."

	cat /init.sql | envsubst
	# Execution du script
	cat /init.sql | envsubst | /usr/bin/mysqld --user=mysql --bootstrap --debug
fi

echo "[DB config] Accepting remote connexions..."

# Modification du fichier config pour autoriser les connexions en reseau
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# Modification du fichier config pour ecouter sur toutes les interfaces reseau
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

echo "[DB config] Launching mariadb."
# Continuer l'exécution du processus MariaDB avec mysqld
mysqld --user=mysql
