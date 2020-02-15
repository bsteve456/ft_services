FROM alpine:latest

RUN apk update && apk upgrade --available

RUN apk add --no-cache tini openrc busybox-initscripts

RUN apk add openssl && apk add vsftpd  && apk add vim

RUN apk add lftp

RUN adduser steve --disabled-password && echo steve | passwd -d steve

RUN rm etc/vsftpd/vsftpd.conf

ADD srcs/vsftpd.conf etc/vsftpd/vsftpd.conf

RUN rc-update add vsftpd && rc-status && touch run/openrc/softlevel

RUN rc-service vsftpd start && rc-status
