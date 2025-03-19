FROM alpine:3

RUN apk add --no-cache vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /var/log
RUN touch /var/log/vsftpd.log
RUN chmod 0644 /var/log/vsftpd.log

EXPOSE 20 21 40000-50000

#CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
CMD ["/bin/sh", "-c", "/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf & tail -F /var/log/vsftpd.log"]

