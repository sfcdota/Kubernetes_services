# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:55 by cbach             #+#    #+#              #
#    Updated: 2020/12/11 13:34:35 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=cbach/CN=localhost"


service mysql start
mysql -u root --skip-password -e "\
		CREATE DATABASE wordpress;\
		GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
		UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';\
		FLUSH PRIVILEGES;\
		EXIT" &
