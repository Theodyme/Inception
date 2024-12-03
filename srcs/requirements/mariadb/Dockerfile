FROM alpine:3.19

# 	program install

RUN	apk update && apk upgrade
RUN	apk add curl \
	nano \
	mariadb mariadb-client \
	gettext

#	copy config file

#COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN	mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
#RUN	chown -R mysql:mysql /var/lib/mysql

#	setting entrypoint

COPY	tools/mariadb.sh /usr/local/bin/mariadb.sh
COPY	tools/init.sql /init.sql
RUN	chmod +x /usr/local/bin/mariadb.sh

EXPOSE	3306

ENTRYPOINT	[ "/usr/local/bin/mariadb.sh" ]
