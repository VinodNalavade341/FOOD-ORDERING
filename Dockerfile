FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip zip libzip-dev \
    && docker-php-ext-install zip pdo_mysql

# Enable Apache rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy app source
COPY . .

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80
