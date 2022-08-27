FROM composer

FROM php:8.0-fpm
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get upgrade -y && apt-get install -y zlib1g-dev libzip-dev libpng-dev libxml2-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install dom
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR '/var/www'

ARG LARAVEL_VERSION
RUN composer create-project laravel/laravel temp "$LARAVEL_VERSION"

COPY /files_be/composer.json ./temp
#COPY /files_be/composer.lock ./temp
#COPY /files_be/app/Helpers ./temp/app/Helpers

RUN composer install --working-dir temp

COPY /files_be ./api

RUN cp -r temp/vendor api
RUN composer install --working-dir api
RUN rm -r temp

WORKDIR 'api'
RUN mkdir -p storage/framework/sessions
RUN mkdir -p storage/framework/views
RUN mkdir -p storage/framework/cache
RUN chmod o+w ./storage/ -R
RUN chown -R $USER:www-data storage
RUN chown -R $USER:www-data bootstrap/cache


