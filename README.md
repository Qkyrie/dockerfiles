DockerFile for invoice ninja (https://www.invoiceninja.com/)

#Running the container

```
docker run -d -p 127.0.0.1:9010:9000 --link pikachu-mysql:mysql -e DB_DATABASE=ninja -e DB_USERNAME=invoiceninja -e DB_HOST=mysql -e DB_PASSWORD=invoiceninjapwd qkyrie/invoiceninja:1.7
```

#Mounting Volumes

```
docker run -d -v "$PWD"/config:/var/www/app/config -v "$PWD"/public:/var/www/app/public -v "$PWD"/storage:/var/www/app/storage --name invoiceninja -p 127.0.0.1:9010:9000 --link pikachu-mysql:mysql -e DB_DATABASE=ninja -e DB_USERNAME=invoiceninja -e DB_HOST=mysql -e DB_PASSWORD=invoiceninjapwd qkyrie/invoiceninja:1.7
```

##Installing

###Generating the initial database
```
php artisan migrate
```
###Seeding the database for God knows what reason
```
php artisan db:seed
```
###Generating a secret key to use
```
php artisan key:generate
```
```
vi app/config/app.php
```
```
'key' => 'iL7OD2fbvjJvIcSgalLThFaEM4gPtPNF'
```

##Adding Debugging

```
-e APP_DEBUG=1
```
