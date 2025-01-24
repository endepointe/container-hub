# Dockerfile for SMTP/IMAP
FROM alpine:3.20

# Install required packages
RUN apk add postfix openssl

# Preserve default main.cf
#COPY /etc/postfix/main.cf /etc/postfix/main.cf.default

# Configure Postfix
COPY ./config/postfix/main.cf /etc/postfix/main.cf
#COPY ./config/postfix/relay_recipients /etc/postfix/relay_recipients # maybe 
#COPY ./config/postfix/master.cf /etc/postfix/master.cf

# Configure Dovecot
#COPY ./config/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
#COPY ./config/dovecot/conf.d /etc/dovecot/conf.d
#RUN mkdir -p /var/mail/vhosts #&& chown -R dovecot:dovecot /var/mail/vhosts

# Open necessary ports
#EXPOSE 25 143 587 993

# Start services
#CMD ["sh", "-c"]
#CMD ["postfix", "start-fg"]
