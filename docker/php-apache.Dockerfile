FROM php:7.3.3-apache

# RUN echo '127.0.0.1       localhost.localdomain   localhost' >> /etc/hosts

# install uzip to extract craft install, then some things
# for imagick
RUN apt-get update && \
    apt-get install -y \
    unzip \
    libmagickwand-dev
RUN pecl install imagick

# install PHP extensions required by craft
RUN docker-php-ext-install \
    pdo_mysql
RUN docker-php-ext-enable imagick

ADD php.ini /usr/local/etc/php/php.ini

# remove default site setup
RUN rm /etc/apache2/sites-enabled/000-default.conf
# add setup for vhost
ADD apache-vhost.conf /etc/apache2/sites-enabled/000-apachevhost.conf
# add setup for config options
ADD apache.conf /etc/apache2/conf-enabled/000-apache.conf

# add mod_rewrite support
RUN a2enmod rewrite


# download and install craft
# RUN rm -d /var/www/craftcms-v2.zip &>/dev/null
# RUN curl https://craftcms.com/latest-v2.zip --output /var/www/craftcms-v2.zip -L
# RUN unzip /var/www/craftcms-v2.zip -d /var/www

# rename htaccess to .htaccess
# RUN mv /var/www/public/htaccess /var/www/public/.htaccess &>/dev/null

# set database in craft files
# RUN sed -i "/'server' => 'localhost',/c   'server' => 'database'," /var/www/craft/config/db.php

# needed extensions:
# - PDO MySQL Extension
# - Mcrypt Extension
# - GD Extension
# - OpenSSL Extension
# - crypt() Extension with BLOWFISH_CRYPT enabled

# optional extensions:
# - ImageMagick Extension
