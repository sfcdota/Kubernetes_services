# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:27 by cbach             #+#    #+#              #
#    Updated: 2021/01/26 14:44:41 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer = "cbach"

WORKDIR /dir/
COPY ./srcs/ .

RUN apk update && apk upgrade && apk add --no-cache wget nginx php php-mysqli php-fpm \
	php-curl php-gd php-intl php-mbstring php-soap php-json \
	php-xml php-xmlrpc php-zip supervisor && mkdir -p /run/nginx /var/www/html && \
	mv localhost /etc/nginx/conf.d/default.conf && mv supervisord.conf /etc/supervisord.conf && \
	cd /var/www/html/  && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz && \
	chown -R 777 /var/www/html/* && \
	cd /dir && mv wp-config.php /var/www/html/wordpress/ && \
	sed -i 's/daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf


EXPOSE 5050

CMD ["/usr/bin/supervisord"]
