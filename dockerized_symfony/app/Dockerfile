FROM php:7.1-fpm-alpine

RUN apk add --no-cache \
    autoconf \
    bash \
    g++ \
    git \
    icu-dev \
    make \
    zlib-dev \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY . /srv

COPY ./php.ini "${PHP_INI_DIR}/conf.d/php.ini"

WORKDIR /srv

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN composer install \
    --no-interaction \
    --no-scripts \
    --optimize-autoloader \
    --prefer-dist

VOLUME ["/srv/vendor", "/srv/var"]
