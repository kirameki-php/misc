FROM php:8-cli-alpine

COPY files /
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# Production ENVs
#ENV PHP_ZEND_ASSERTIONS=0
#ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=0

RUN set -e \
    && apk add --no-cache bash coreutils git icu-libs libstdc++ libxml2 tzdata \
    && apk add --no-cache --virtual=.build-deps autoconf g++ icu-dev make \
    && docker-php-ext-install -j$(nproc) bcmath intl opcache pcntl pdo pdo_mysql \
    && docker-php-pecl-install apcu \
    && docker-php-pecl-install igbinary \
    && docker-php-pecl-install pcov \
    && docker-php-pecl-install redis --enable-redis-igbinary \
    && apk del .build-deps \
    && docker-php-source delete \
    && mkdir -p /app

WORKDIR /app
