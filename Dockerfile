FROM php:fpm

MAINTAINER Samuel Laulhau <sam@lalop.co>

#####
# SYSTEM REQUIREMENT
#####
RUN apt-get update \
    && apt-get install -y \
        libmcrypt-dev zlib1g-dev git \
        libfreetype6-dev libjpeg62-turbo-dev libpng12-dev\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install iconv mcrypt mbstring pdo pdo_mysql zip gd \
    && rm -rf /var/lib/apt/lists/*

#####
# INSTALL COMPOSER
#####
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


######
# DEFAULT ENV
######
ENV DB_HOST mysql
ENV DB_DATABASE ninja
ENV APP_KEY SomeRandomString
ENV LOG errorlog
ENV APP_DEBUG 0


VOLUME /var/www/app
WORKDIR /var/www/app

EXPOSE 80
EXPOSE 9000

COPY app-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
