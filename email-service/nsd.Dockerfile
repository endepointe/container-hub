FROM alpine:3.20

RUN apk update \
    && apk upgrade \
    && apk add nsd bind-tools

COPY nsd.conf /etc/nsd/
COPY test.local.zone /etc/nsd/

RUN mkdir -p /run/nsd && chmod 511 /run/nsd

EXPOSE 53/tcp
EXPOSE 53/udp

