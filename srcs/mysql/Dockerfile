# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:58 by cbach             #+#    #+#              #
#    Updated: 2021/01/18 17:55:27 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

COPY ./srcs/ .

RUN apk -U upgrade && apk add --no-cache mysql mysql-client supervisor && mv supervisord.conf /etc/supervisord.conf && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && chmod 777 /var/run/mysqld

RUN mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid --port=3306 \
--bind-address=0.0.0.0 --skip-networking=OFF  && mv mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
#RUN sh boot.sh
#RUN sh boot.sh && sleep 10 && pkill mysql && pkill mysqld &&
# RUN mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid
	# mysqld -u root & && mysql -u root --skip-password -e "\
 	# 		CREATE DATABASE wordpress;\
 	# 		GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';\
 	# 		UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';\
 	# 		FLUSH PRIVILEGES;\
 	# 		EXIT;" &

# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
# comment out a few problematic configuration values
# mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid
# mysql_install_db --user=mysql --datadir=/var/lib/mysql &&
# /usr/bin/mysqld --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid -u root & && \
# 	mysql -u root --skip-password -e "\
# 			CREATE DATABASE wordpress;\
# 			GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';\
# 			UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';\
# 			FLUSH PRIVILEGES;\
# 			EXIT;" &  && \
# 			kill pidof /usr/bin/mysqld --datadir=./data --pid-file=/run/mysqld
# /etc/init.d/mariadb setup && mariadb



EXPOSE 3306

CMD ["/usr/bin/supervisord"]
