FROM alpine:3.20.3

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/bonus/static_website/conf/default.conf /etc/nginx/http.d/default.conf

COPY requirements/bonus/static_website/conf/*  /var/www/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
