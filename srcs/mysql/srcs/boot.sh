# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:55 by cbach             #+#    #+#              #
#    Updated: 2021/01/26 14:50:18 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mysql -u root -e "CREATE DATABASE wordpress;\
	CREATE USER 'cbach'@'%';\
	SET password FOR 'cbach'@'%' = password('pass');\
	GRANT ALL PRIVILEGES ON wordpress.* TO 'cbach'@'%' IDENTIFIED BY 'pass';\
	FLUSH PRIVILEGES;" && service mariadb stop && mysqld_safe


#mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid --port=3306 --bind-address=0.0.0.0 --skip-networking=OFF #dp porta vse rabotalo
#sleep 3
#mysqld --user=root --basedir=/usr --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid --port=3306 --bind-address=0.0.0.0 --skip-networking=OFF &
# mysql -u root --skip-password -e "\
#  	 		CREATE DATABASE wordpress;\
#  	 		GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';\
# 			ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('');
#  	 		FLUSH PRIVILEGES;"
 	 		# UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';\
# use wordpress UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';

# mysql -u root --execute="CREATE DATABASE wordpress;"
# mysql -u root wordpress < wordpress.sql
# mysql -u root --execute="CREATE USER 'cbach'@'%';"
# mysql -u root --execute="SET password FOR 'cbach'@'%' = password('password');"
# mysql -u root --execute="GRANT ALL PRIVILEGES ON wordpress.* TO 'cbach'@'%' IDENTIFIED BY 'password';"
# mysql -u root --execute="FLUSH PRIVILEGES;"
