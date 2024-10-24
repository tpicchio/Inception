FROM debian:11

RUN apt-get update -y && \
	apt-get upgrade -y && \
    apt install -y php-fpm php-mysql && \
    apt install curl -y

CMD ["php-fpm"]
