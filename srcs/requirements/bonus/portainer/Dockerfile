FROM alpine:3.20.3

RUN apk add --no-cache \
    curl \
    ca-certificates \
    tar \
    libc6-compat \
    su-exec \
    && update-ca-certificates

RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.0/portainer-2.19.0-linux-amd64.tar.gz -o portainer.tar.gz
    
RUN tar -xvzf portainer.tar.gz ; rm portainer.tar.gz

EXPOSE 9000

CMD ["portainer/portainer"]
