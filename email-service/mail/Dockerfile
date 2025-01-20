# Dockerfile for SMTP/IMAP
FROM alpine:3.20

# Install required packages
RUN apk add postfix dovecot openssl bash

# Configure Postfix
COPY ./config/postfix/main.cf /etc/postfix/main.cf
COPY ./config/postfix/master.cf /etc/postfix/master.cf
RUN postmap /etc/postfix/main.cf

# Configure Dovecot
COPY ./config/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY ./config/dovecot/conf.d /etc/dovecot/conf.d
RUN mkdir -p /var/mail/vhosts && chown -R dovecot:dovecot /var/mail/vhosts

# Open necessary ports
EXPOSE 25 143 587 993

# Start services
CMD ["sh", "-c", "postfix start && dovecot -F"]
