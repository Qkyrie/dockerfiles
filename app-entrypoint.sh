#!/bin/bash
set -e

echo "adding username and password to the .env file"
echo "DB_USERNAME=$DB_USERNAME" >> .env
echo "DB_PASSWORD=$DB_PASSWORD" >> .env

chown www-data .env

exec "$@"
