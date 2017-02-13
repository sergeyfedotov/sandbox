FROM php:7.1-fpm-alpine

RUN apk add --no-cache \
    bash \
    git \
    icu-dev \
    zlib-dev \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip

COPY . /srv

WORKDIR /srv

RUN ln -s ./php.ini "${PHP_INI_DIR}/conf.d/php.ini"

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN chown -R www-data .

USER www-data

RUN composer install \
    --no-interaction \
    --no-scripts \
    --optimize-autoloader \
    --prefer-dist

VOLUME ["/srv/vendor", "/srv/var"]
