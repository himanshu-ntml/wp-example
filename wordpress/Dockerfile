# Pin an explicit WP/PHP variant to avoid surprises
FROM wordpress:6.6.1-php8.2-apache

# Example: install extra extensions as needed
# RUN docker-php-ext-install mysqli gd opcache

# Copy PHP overrides into the configured directory
COPY php/conf.d/*.ini /usr/local/etc/php/conf.d/

# (Optional) If you keep themes/plugins in git, copy them
# COPY wp-content/ /var/www/html/wp-content/

# Permissions
RUN chown -R www-data:www-data /var/www/html
