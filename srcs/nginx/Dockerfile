# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:08 by cbach             #+#    #+#              #
#    Updated: 2021/01/13 23:57:53 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache  nginx \
						openssh \
						openssl \
						openrc \
						supervisor


COPY ./srcs .

RUN mkdir -p /run/nginx /var/run/sshd /var/log/supervisor /var/www/html && mv sshd_config /etc/ssh/sshd_config && \
	mv localhost /etc/nginx/conf.d/default.conf && mv supervisord.conf /etc/supervisord.conf && \
	chown -R 777 /var/www/html/ && \
	openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem \
	-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost" && \
	rc-update add sshd && rc-update add nginx && \
	ssh-keygen -A && rc-status && touch /run/openrc/softlevel && \
	echo "root:root" | chpasswd


EXPOSE 80 443 22

CMD ["/usr/bin/supervisord"]
