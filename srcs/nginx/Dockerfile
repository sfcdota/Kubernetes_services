# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:08 by cbach             #+#    #+#              #
#    Updated: 2021/01/12 12:34:15 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache  nginx \
						openssh \
						openssl \
						sudo \
						bash



COPY ./srcs/ .

RUN mkdir -p /run/nginx

RUN mv localhost /etc/nginx/conf.d/default.conf && mkdir -p /var/www/html && chown -R 777 /var/www/html/
RUN openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost"

EXPOSE 80 443 22

CMD ["nginx", "-g", "daemon off;"]
