# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:32 by cbach             #+#    #+#              #
#    Updated: 2021/01/12 17:52:29 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NGINX_DIR=srcs/nginx
FTPS_DIR=srcs/ftps
GRAFANA_DIR=srcs/grafana
INFLUXDB_DIR=srcs/influxdb
METALLB_DIR=srcs/metallb
MYSQL_DIR=srcs/mysql
PHPMYADMIN_DIR=srcs/phpmyadmin
WORDPRESS_DIR=srcs/wordpress

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

# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# # On first install only
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl apply -f srcs/metallb/metallb.yaml



#images
docker build -t nginx $NGINX_DIR


#configs
kubectl create -f $NGINX_DIR/nginx-deployment.yaml
kubectl create -f $NGINX_DIR/nginx-service.yaml


# to get into nginx service:
# minikube tunnel
# kubectl get svc
# then go external-ip with or without some ports


