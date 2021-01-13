# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:32 by cbach             #+#    #+#              #
#    Updated: 2021/01/12 18:27:27 by cbach            ###   ########.fr        #
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


# clearing
eval $(minikube docker-env)
# kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all
# docker rm -f $(docker ps -a -q)
# docker system prune -f
# sleep 3


# #metallb
# kubectl delete -f srcs/nginx/nginx-service.yaml && minikube addons disable metallb && \
# minikube addons enable metallb && kubectl apply -f srcs/metallb/metallb.yaml && kubectl create -f srcs/nginx/nginx-service.yaml
#minikube addons enable metallb

#set metallb config
kubectl apply -f srcs/metallb/metallb.yaml



#images
docker build -t nginx $NGINX_DIR


#configs
kubectl create -f $NGINX_DIR/nginx-deployment.yaml
kubectl create -f $NGINX_DIR/nginx-service.yaml


# to get into nginx service:
# minikube tunnel
# kubectl get svc
# then go external-ip with or without some ports


