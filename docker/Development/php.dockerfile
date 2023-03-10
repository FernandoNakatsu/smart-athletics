FROM php:8.1-fpm-alpine

ARG CURRENT_USER=${CURRENT_USER:-smart-athletics}
ARG CURRENT_UID=${CURRENT_UID:-1000}
ARG CURRENT_GID=${CURRENT_GID:-1000}

ENV CURRENT_USER=$CURRENT_USER
ENV CURRENT_UID=$CURRENT_UID
ENV CURRENT_GID=$CURRENT_GID

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"

# Install PECL and PEAR  extensions
RUN apk add --no-cache git openssh \
    $PHPIZE_DEPS

RUN apk --update add --no-cache git

RUN docker-php-source delete

RUN mkdir -p /var/www

RUN (adduser -h /home/${CURRENT_USER} -D -u ${CURRENT_UID} ${CURRENT_USER} \
    && mkdir -p /home/$CURRENT_USER \
    && chown -R "${CURRENT_UID}:${CURRENT_UID}" /home/${CURRENT_USER})

USER $CURRENT_USER