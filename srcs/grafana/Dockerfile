FROM alpine:3.11.3

RUN apk update && apk add vim

RUN apk add openrc

RUN apk -f add nginx

RUN rc-update add nginx && rc-status

RUN touch /run/openrc/softlevel

RUN apk add musl

RUN apk add busybox

RUN apk add grafana --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing
