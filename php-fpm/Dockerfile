FROM composer:latest as composer

FROM php:7.3.11-fpm-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require hirak/prestissimo

ARG PROJECT_PATH

RUN echo ${PROJECT_PATH}

ADD ${PROJECT_PATH} /var/www/html

RUN composer run post-root-package-install

RUN composer install

RUN composer run post-create-project-cmd
