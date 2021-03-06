FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www/html

COPY ./laravel .
RUN composer update --no-scripts
RUN chown -R www-data:www-data /var/www
