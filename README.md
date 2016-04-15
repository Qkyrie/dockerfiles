DockerFile for invoice ninja (https://www.invoiceninja.com/)

docker run -d -v "$PWD":/var/www/app --name invoiceninja -p 127.0.0.1:9010:9000 --link pikachu-mysql:mysql -e DB_DATABASE=ninja -e DB_USERNAME=invoiceninja -e DB_HOST=mysql -e DB_PASSWORD=invoiceninjapwd qkyrie/invoiceninja:1.1

##Installing

apt-get update
apt-get install vim

user@myVPS:~# php artisan migrate
user@myVPS:~# php artisan db:seed

user@myVPS:~# php artisan key:generate
user@myVPS:~# vim app/config/app.php
'key' => 'iL7OD2fbvjJvIcSgalLThFaEM4gPtPNF'

##Adding Debugging
-e APP_DEBUG=1
