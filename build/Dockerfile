FROM php:7.3.11-fpm-alpine as php_runtime
COPY build/php.ini /usr/local/etc/php/php.ini
ENV PHP_INI_MAX_EXECUTION_TIME=30 PHP_INI_MEMORY_LIMIT="128M" PHP_INI_ERROR_REPORTING=22519 PHP_INI_DISPLAY_ERRORS="On"
WORKDIR /app

FROM nginx:1.17.5-alpine as nginx_runtime
COPY build/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /app
