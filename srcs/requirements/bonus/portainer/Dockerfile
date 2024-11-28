FROM alpine:3.20.3

# Installazione delle dipendenze necessarie
RUN apk update && apk add --no-cache \
    ca-certificates \
    curl \
    tar \
    && update-ca-certificates

# Verifica il download di Portainer
RUN curl -LO https://github.com/portainer/portainer/releases/download/2.21.4/portainer-2.21.4-linux-amd64.tar.gz \
    && tar -xzvf portainer-2.21.4-linux-amd64.tar.gz \
    && mv portainer /usr/local/bin/portainer \
    && chmod +x /usr/local/bin/portainer/portainer \
    && rm portainer-2.21.4-linux-amd64.tar.gz

# Crea un volume per i dati persistenti
VOLUME /data

# Esponi la porta 9000 per Portainer
EXPOSE 9000

USER root

# Avvia Portainer
CMD ["/usr/local/bin/portainer/portainer", "--host", "0.0.0.0"]
