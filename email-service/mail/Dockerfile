# mailserver running postfix and dovecot (tbd) 
FROM alpine:3.20

RUN apk add postfix mysql mysql-client postfix-mysql dovecot openssl 

COPY ./config/postfix/main.cf /etc/postfix/main.cf
COPY ./config/postfix/mysql-aliases.cf /etc/postfix/mysql-aliases.cf

RUN mkdir -p /var/log/

EXPOSE 25 143 587 993

CMD ["postfix", "start-fg"]
