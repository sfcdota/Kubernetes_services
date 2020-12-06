FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache wget -y

RUN wget http://wordpress.org/latest.tar.gz && tar xvfz latest.tar.gz && mv wordpress/* /var/www/html/

RUN chown -R www-data /var/www/html/

RUN chmod 755 /var/www/html

COPY ./srcs/ .

EXPOSE 80 443

CMD bash boot.sh