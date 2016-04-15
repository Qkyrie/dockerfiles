#!/bin/bash
set -e

#####
# DOWNLOAD AND INSTALL INVOICE NINJA
#####

ENV INVOICENINJA_VERSION 2.5.1.3
#ENV INVOICENINJA_SHA1 3e9b63c1681b6923dc1a24399411c1abde6ef5ea

if [ -f /.invoiceninja-installed ]; then
	echo "installing invoiceninja for the first time"
	RUN curl -o invoiceninja.tar.gz -SL https://github.com/hillelcoren/invoice-ninja/archive/v${INVOICENINJA_VERSION}.tar.gz \
	#    && echo "$INVOICENINJA_SHA1 *invoiceninja.tar.gz" | sha1sum -c - \
	    && tar -xzf invoiceninja.tar.gz -C /var/www/ \
	    && rm invoiceninja.tar.gz \
	    && mv /var/www/invoiceninja-${INVOICENINJA_VERSION}/* /var/www/app/. \
	    && chown -R www-data:www-data /var/www/app \
	    && composer install --working-dir /var/www/app -o --no-dev --no-interaction  --prefer-source

			echo "gratz! invoiceninja installed!"

			echo "adding username and password to the .env file"
			echo "DB_USERNAME=$DB_USERNAME" >> .env
			echo "DB_PASSWORD=$DB_PASSWORD" >> .env

			chown www-data .env
fi

touch /.invoiceninja-installed

exec "$@"
