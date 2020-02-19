FROM alpine:latest

RUN apk update && apk upgrade --available

RUN apk add --no-cache tini openrc busybox-initscripts && apk add --no-cache bash

RUN apk add openssl && apk add vsftpd  && apk add vim

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/CN=ftps/O=ftps"

ADD vsftpd.pem  /etc/ssl/private/vsftpd.pem

RUN apk add lftp

RUN adduser steve --disabled-password && echo steve | passwd -d steve

RUN mkdir home/steve/ftp && echo "Hello World" >> home/steve/ftp/anon.txt

RUN rm etc/vsftpd/vsftpd.conf

RUN chmod 757 home/steve/ftp/ && chown -R steve home/steve/ftp

RUN echo "steve" | tee -a /etc/vsftpd.userlist

ADD vsftpd.conf etc/vsftpd/vsftpd.conf

RUN rc-update add vsftpd && rc-status && touch run/openrc/softlevel

ADD start_ftps.sh /start_ftps.sh

RUN chmod 755 /start_ftps.sh

ENTRYPOINT ["/start_ftps.sh"]
