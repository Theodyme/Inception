FROM debian:bullseye

#       program install

RUN	apt-get update && apt-get upgrade -y &&\
	apt-get install -y\
	wget curl mariadb-client gettext moreutils php-fpm php-mysql

#	wp-cli install

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

#	open port

EXPOSE	9000

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/

#	setting entrypoint

COPY	tools/wp-init.sh /wp-init.sh
RUN	chmod +x /wp-init.sh

COPY	conf/wp-config.php /wp-config.php

RUN mkdir -p /run/php

WORKDIR	"/var/www/html/"

ENTRYPOINT	[ "/wp-init.sh" ]
