FROM php:7-fpm
MAINTAINER yu-ji
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        zip unzip wget git mysql-client \
    && docker-php-ext-install -j$(nproc) mbstring mcrypt mysqli opcache zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && rm -rf /var/lib/apt/lists/*

RUN echo "" >> /usr/local/etc/php-fpm.conf && echo "php_flag[display_errors] = off" >> /usr/local/etc/php-fpm.conf && echo "php_flag[expose_php] = off" >> /usr/local/etc/php-fpm.conf
