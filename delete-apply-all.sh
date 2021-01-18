kubectl delete deployment --all
kubectl delete svc --all
docker rm -f $(docker ps -a -q)
docker build -t nginx ./nginx/
docker build -t ftps ./ftps/
docker build -t mysql ./mysql/
docker build -t phpmyadmin ./phpmyadmin/

kubectl apply -f ./ftps/ftps.yaml
kubectl apply -f ./mysql/mysql.yaml
kubectl apply -f ./wordpress/wordpress.yaml
kubectl apply -f ./nginx/nginx.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin.yaml
kubectl rollout restart deployments
