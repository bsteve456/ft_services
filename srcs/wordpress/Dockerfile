FROM alpine:3.11.3

RUN apk update && apk add vim

RUN apk add openrc && apk add nginx

RUN rc-update add nginx

RUN mkdir /run/nginx && touch /run/nginx/nginx.pid

RUN apk add php7 php7-fpm php7-opcache && rc-update add php-fpm7

RUN rm etc/nginx/conf.d/default.conf

ADD default.conf etc/nginx/conf.d/

RUN  rc-status 

RUN touch /run/openrc/softlevel

RUN wget https://wordpress.org/latest.tar.gz

RUN tar xzvf latest.tar.gz && mv wordpress /usr/share/wordpress

RUN ln -s /usr/share/wordpress/ /var/www/localhost/htdocs/

ADD start.sh /start.sh

RUN chmod 755 start.sh

VOLUME ["/sys/fs/cgroup"]

ENTRYPOINT ["sh", "/start.sh"]

