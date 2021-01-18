# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:17 by cbach             #+#    #+#              #
#    Updated: 2021/01/18 11:28:44 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/
COPY ./srcs/ .

RUN apk -U upgrade && apk add --no-cache openssl nginx wget phpmyadmin php7-fpm supervisor && \
		mkdir -p /run/nginx /var/www/html && mv localhost /etc/nginx/conf.d/default.conf && \
		mv supervisord.conf /etc/supervisord.conf && chmod -R 777 /var/www/html && \
		mv /usr/share/webapps/* /var/www/html/ && mv config.inc.php /var/www/html/phpmyadmin/config.inc.php


EXPOSE 5000

CMD ["/usr/bin/supervisord"]
