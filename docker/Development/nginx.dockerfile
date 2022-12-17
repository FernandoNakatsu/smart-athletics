FROM nginx:alpine

ADD docker/Development/nginx/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www
