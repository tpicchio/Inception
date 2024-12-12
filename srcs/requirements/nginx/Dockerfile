FROM alpine:3.20.3

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/bonus/static_website/*  /var/www/static/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
