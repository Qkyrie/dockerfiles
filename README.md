DockerFile for invoice ninja (https://www.invoiceninja.com/)

This image is based on `php:7` official version.

docker run -d -p 127.0.0.1:8080:80 --link pikachu-mysql:mysql -e DB_DATABASE=invoiceninja -e DB_USERNAME="invoiceninja" -e DB_PASSWORD"password" 
