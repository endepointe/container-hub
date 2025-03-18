# mailserver running postfix and dovecot (tbd) 
FROM alpine:3.20

RUN apk update && \
    apk add postfix postfix-ldap


COPY ./config/postfix/main.cf /etc/postfix/main.cf
#COPY ./config/postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
#COPY ./config/postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf
#COPY ./config/postfix/mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf


RUN mkdir -p /var/log/

EXPOSE 25/tcp 143/tcp 587/tcp 993/tcp

CMD ["postfix", "start-fg"]
#COPY run.sh .
#CMD ["/bin/sh", "run.sh"]

#COPY runtest.sh .
#CMD ["/bin/sh", "runtest.sh"]

