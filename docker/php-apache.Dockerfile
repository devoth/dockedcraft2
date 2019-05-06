FROM php:7.3.3-apache

RUN echo '127.0.0.1       localhost.localdomain   localhost' >> /etc/hosts

# install PHP extensions required by craft
RUN docker-php-ext-install pdo_mysql

ADD php.ini /usr/local/etc/php/php.ini

# remove default site setup
RUN rm /etc/apache2/sites-enabled/000-default.conf
# add setup for vhost
ADD apache-vhost.conf /etc/apache2/sites-enabled/000-apachevhost.conf
# add setup for config options
ADD apache.conf /etc/apache2/conf-enabled/000-apache.conf

# try to remove html folder - DOESN'T FUCKING WORK
RUN rm -d /var/www/html



# add mod_rewrite support
# RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN a2enmod rewrite

# rename htaccess to .htaccess
RUN mv /var/www/public/htaccess /var/www/public/.htaccess &>/dev/null

# needed extensions:
# - PDO MySQL Extension
# - Mcrypt Extension
# - GD Extension
# - OpenSSL Extension
# - crypt() Extension with BLOWFISH_CRYPT enabled

# optional extensions:
# - ImageMagick Extension
