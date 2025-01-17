FROM alpine:3.20

RUN apk update \
    && apk upgrade \
    && apk add \
        bind \
        bind-tools \
        openrc

COPY named.conf /etc/bind/
COPY example.com /etc/bind/

EXPOSE 53/tcp
EXPOSE 53/udp
