# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:32 by cbach             #+#    #+#              #
#    Updated: 2021/01/28 21:52:58 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#set DIR variables
NGINX_DIR=srcs/nginx
FTPS_DIR=srcs/ftps
GRAFANA_DIR=srcs/grafana
INFLUXDB_DIR=srcs/influxdb
METALLB_DIR=srcs/metallb
MYSQL_DIR=srcs/mysql
PHPMYADMIN_DIR=srcs/phpmyadmin
WORDPRESS_DIR=srcs/wordpress


#start minikube VM
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb


lastoctet=$(echo $(minikube ip) | grep -Eo "[0-9]+$")
lastoctet=$(($lastoctet + 1))
freeipstart=$(echo $(minikube ip) | sed "s/[0-9]\{3,\}$/"$lastoctet"/g")
freeipend=$(echo $(minikube ip) | sed "s/[0-9]\{3,\}$/"$(($lastoctet + 10))"/g")
echo "minikube ip = $(minikube ip)\\nFirst free ip in minikube subnet = $freeipstart"
echo "changing metallb config to working properly with random minikube ip..."
sed -i "s/IPRANGE/"$freeipstart"-"$freeipend"/g" srcs/metallb/metallb.yaml
echo "iprange is now set"
echo "set pasv_address to ftps config to support ftp join via terminal"
sed -i "s/pasv_address=.*$/pasv_address="$freeipstart"/g" srcs/ftps/configs/vsftpd.conf


#set metallb config
kubectl apply -f srcs/metallb/metallb.yaml

#images
docker build --no-cache -t nginx $NGINX_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t nginx $NGINX_DIR
  sleep 2
done
docker build --no-cache -t phpmyadmin $PHPMYADMIN_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t phpmyadmin $PHPMYADMIN_DIR
  sleep 2
done
docker build --no-cache -t ftps $FTPS_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t ftps $FTPS_DIR
  sleep 2
done
docker build --no-cache -t mysql $MYSQL_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t mysql $MYSQL_DIR
  sleep 2
done
docker build --no-cache -t wordpress $WORDPRESS_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t wordpress $WORDPRESS_DIR
  sleep 2
done

docker build --no-cache -t grafana $GRAFANA_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t grafana $GRAFANA_DIR
  sleep 2
done

docker build --no-cache -t influxdb $INFLUXDB_DIR
while [ $? -ne 0 ]; do
  docker build --no-cache -t influxdb $INFLUXDB_DIR
  sleep 2
done


#configs
kubectl apply -f $NGINX_DIR/nginx.yaml
kubectl apply -f $PHPMYADMIN_DIR/phpmyadmin.yaml
kubectl apply -f $FTPS_DIR/ftps.yaml
kubectl apply -f $MYSQL_DIR/mysql.yaml
kubectl apply -f $WORDPRESS_DIR/wordpress.yaml
kubectl apply -f $GRAFANA_DIR/grafana.yaml
kubectl apply -f $INFLUXDB_DIR/influxdb.yaml

minikube dashboard &
