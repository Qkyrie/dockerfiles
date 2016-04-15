#!/bin/bash
set -e

cp -avr /var/www/app/docker-backup-config/* /var/www/app/config/.
cp -avr /var/www/app/docker-backup-public/* /var/www/app/public/.
cp -avr /var/www/app/docker-backup-storage/* /var/www/app/storage/.
rm -rf /var/www/app/docker-backup-public/*
rm -rf /var/wwww/app/docker-backup-config/*
rm -rf /var/wwww/app/docker-backup-storage/*

exec "$@"
