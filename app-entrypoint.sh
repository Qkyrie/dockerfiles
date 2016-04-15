#!/bin/bash
set -e

#####
# DOWNLOAD AND INSTALL INVOICE NINJA
#####

if [ ! -f /.invoiceninja-installed ]; then
	echo "installing invoiceninja for the first time"
	curl -o invoiceninja.tar.gz -SL https://github.com/hillelcoren/invoice-ninja/archive/v2.5.1.3.tar.gz
	tar -xzf invoiceninja.tar.gz -C /var/www/
	rm invoiceninja.tar.gz
	mv /var/www/invoiceninja-2.5.1.3/* /var/www/app/.
	rmdir /var/www/invoiceninja-2.5.1.3
	chown -R www-data:www-data /var/www/app
	composer install --working-dir /var/www/app -o --no-dev --no-interaction  --prefer-source

			echo "gratz! invoiceninja installed!"

			echo "adding username and password to the .env file"
			echo "DB_USERNAME=$DB_USERNE" >> .env
			echo "DB_PASSWORD=$DB_PASSWORD" >> .env

			chown www-data .env
			chown -R /var/www/app
fi

touch /.invoiceninja-installed

exec "$@"
