# mailserver running postfix and dovecot (tbd) 
FROM alpine:3.20

RUN apk add postfix openssl

COPY ./config/postfix/main.cf /etc/postfix/main.cf

#COPY ./config/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
#COPY ./config/dovecot/conf.d /etc/dovecot/conf.d

EXPOSE 25 143 587 993

CMD ["postconf", "maillog_file=", "/var/log/postfix.log"]
CMD ["postconf", "maillog_file_permissions=", "0644"]
#CMD ["postfix", "start-fg"]
#CMD ["sh"]
