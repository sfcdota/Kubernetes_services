FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache -y nginx wget php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && tar xvfz phpMyAdmin-latest-all-languages.tar.gz

RUN mv -t /var/www/html/ phpMyAdmin

RUN rm /etc/nginx/sites-available/defaultrm /etc/nginx/sites-enabled/default

RUN chown -R www-data /var/www/html/

RUN chmod 755 /var/www/html

RUN mv localhost /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
RUN openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost"

RUN service php7.3-fpm start
RUN service nginx start

COPY ./srcs/ .

EXPOSE 80 443

CMD service php7.3-fpm start