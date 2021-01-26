# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:58 by cbach             #+#    #+#              #
#    Updated: 2021/01/26 15:45:41 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer = "cbach"

WORKDIR /dir/
COPY ./srcs/ .
VOLUME /sys/fs/cgroup
VOLUME /var/lib/mysql
RUN apk update && apk upgrade && apk add --no-cache mysql mysql-client supervisor openrc && mv supervisord.conf /etc/supervisord.conf && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && chmod 777 /var/run/mysqld && \
	openrc default && \
	service mariadb setup && cp mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf && service mariadb start && \
	touch /var/log/mysql.log && chown mysql:mysql /var/log/mysql.log && \
	chmod 777 /var/log/mysql.log

EXPOSE 3306

CMD ["/usr/bin/supervisord"]
