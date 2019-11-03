FROM composer:latest as composer

FROM php:7.3.11-fpm-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require hirak/prestissimo