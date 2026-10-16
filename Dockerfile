FROM wordpress:6.6-apache

# Cài thêm các tiện ích PHP thường dùng
RUN apt-get update && apt-get install -y libzip-dev \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# Copy theme và plugin từ repo vào image
COPY themes/ /var/www/html/wp-content/themes/
COPY plugins/ /var/www/html/wp-content/plugins/

RUN chown -R www-data:www-data /var/www/html/wp-content
