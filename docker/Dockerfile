FROM php:8-cli-alpine

COPY files /
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ENV PHP_ZEND_ASSERTIONS=1
ENV PHP_MAX_EXECUTION_TIME=30
ENV PHP_MEMORY_LIMIT=128M
ENV PHP_DISPLAY_ERRORS=0
ENV PHP_DISPLAY_STARTUP_ERRORS=0
ENV PHP_ERROR_LOG=/dev/stderr

ENV PHP_APCU_SHM_SIZE=128M
ENV PHP_APCU_ENTRIES_HINT=4096

ENV PHP_OPCACHE_MEMORY_CONSUMPTION=128
ENV PHP_OPCACHE_INTERNED_STRINGS_BUFFER=16
ENV PHP_OPCACHE_MAX_ACCELERATED_FILES=10000
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=1

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
