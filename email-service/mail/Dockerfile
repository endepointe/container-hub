# mailserver running postfix and dovecot (tbd) 
FROM alpine:3.20

RUN apk add postfix dovecot openssl

COPY ./config/postfix/main.cf /etc/postfix/main.cf

RUN mkdir -p /var/log/

EXPOSE 25 143 587 993

CMD ["postfix", "start-fg"]
