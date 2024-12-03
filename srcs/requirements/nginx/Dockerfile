FROM alpine:3.19

# 	program install

RUN	apk update && apk upgrade
RUN	apk add curl \
	nano \
	nginx \
	openssl

# 	openssl setup (certificate)

RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=flplace.42.fr/UID=login"

#	config setup

RUN	mkdir -p /var/run/nginx
RUN	rm -rf /etc/nginx/nginx.conf
COPY	conf/nginx.conf /etc/nginx/nginx.conf

#	config permissions

RUN	mkdir -p /var/www/html/wordpress/
RUN	chmod 755 /var/www/html/wordpress/
RUN	chown -R nginx:nginx /var/www/html/wordpress/

#	launch

CMD 	[ "nginx", "-g", "daemon off;" ]
