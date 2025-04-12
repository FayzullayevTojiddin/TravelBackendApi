FROM php:8.2-fpm

# System packages
RUN apt-get update && apt-get install -y \
    git curl zip unzip libonig-dev libxml2-dev libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath gd

# Composer o'rnatish
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Laravel loyihani joylash
COPY . /var/www
WORKDIR /var/www

# Composer install
RUN composer install --optimize-autoloader --no-dev

# Laravel permissionlar
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
