docker rm -f $(docker ps -aq)
docker build -t mysql .
docker run -dit --name=mysql -p 3306:3306  mysql
sleep 2
kubectl rollout restart deployment mysql
sleep 5
docker exec -it mysql sh
