#NGINX

rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default

mv localhost /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

chown -R www-data /var/www/html/*
chmod -R 755 /var/www/html/*

openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost"

service nginx start