docker rm -f $(docker ps -a -q)
docker build -t mysql .
docker run -dit --name=mysql -p 3306:3306  mysql
sleep 2
kubectl rollout restart deployments
docker exec -it mysql sh
