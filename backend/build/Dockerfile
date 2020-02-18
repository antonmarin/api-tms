FROM composer:1.9 as composer
FROM php:7.4.2-fpm-alpine as php_runtime

ENV HOME=/root

RUN rm -f "${PHP_INI_DIR}"/php.ini*
COPY build/php.ini "${PHP_INI_DIR}"/
ENV TZ=Etc/UTC \
    PHP_INI_MAX_EXECUTION_TIME=30 \
	PHP_INI_MEMORY_LIMIT=128M \
    PHP_INI_ERROR_REPORTING=22527 \
    PHP_INI_DISPLAY_ERRORS=0
WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER 1
COPY --from=composer /usr/bin/composer /usr/local/bin/
COPY --from=composer /tmp/keys.dev.pub /tmp/keys.tags.pub ${HOME}/.composer/

# hadolint ignore=DL3018,SC2086
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    && \
    pecl install xdebug \
    && \
    apk del --no-network .build-deps && \
    rm -rf /tmp/pear ~/.pearrc

ENV PHP_INI_XDEBUG_REMOTE_HOST=localhost
COPY build/xdebug.ini ${PHP_INI_DIR}/conf.d/

FROM php_runtime
COPY http/ /app/http/
COPY src/ /app/src/
