FROM alpine:3

RUN apk update && apk upgrade && apk add --no-cache vsftpd

RUN adduser -D -g 'ftp' ftpuser
RUN echo "ftpuser:password" | chpasswd
RUN mkdir -p /home/ftpuser/ftp
RUN chown -R ftpuser:ftp /home/ftpuser/ftp
RUN chmod -R 776 /home/ftpuser/ftp
RUN echo "Test contents of file in /home/ftpuser/ftp/" > /home/ftpuser/ftp/flag.txt
run echo "test in home dir" > /home/ftpuser/ftp/t.txt

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

#RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /var/log
RUN touch /var/log/vsftpd.log
RUN chmod 0644 /var/log/vsftpd.log

EXPOSE 20 21 40000-50000

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
#CMD ["/bin/sh", "-c", "/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf & tail -F /var/log/vsftpd.log"]
#CMD ["/bin/sh", "-c", "/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf & tail -F /dev/null"]

