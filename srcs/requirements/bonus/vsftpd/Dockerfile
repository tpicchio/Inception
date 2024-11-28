FROM alpine:3.20.3

ARG FTP_USR
ARG FTP_PWD

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
    echo "${FTP_USR}:${FTP_PWD}" | chpasswd && \
    chown -R ${FTP_USR}:${FTP_USR} /var/www

COPY requirements/bonus/vsftpd/conf/vsftpd.conf /etc/vsftpd/conf/vsftpd.conf

WORKDIR /var/www

EXPOSE 21 21000-21010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/conf/vsftpd.conf"]
