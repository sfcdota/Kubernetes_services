# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:43 by cbach             #+#    #+#              #
#    Updated: 2021/01/14 15:11:52 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/
COPY ./srcs/ .

RUN apk -U upgrade && apk add --no-cache vsftpd supervisor openssl && \
	openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/certs/ftps.key -out /etc/ssl/certs/ftps.pem \
	-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost" && \
	cp vsftpd.conf /etc/vsftpd/vsftpd.conf && mv vsftpd.conf /etc/vsftpd.conf && \
	echo "root:root" | chpasswd

EXPOSE 21 22800 22801
VOLUME ftp/ftp

CMD ["/usr/bin/supervisord"]
