docker rm -f $(docker ps -f "name=wordpress" --format "{{.ID}}")
docker build -t wordpress .
docker run -dit --name=wordpress -p 3306:3306  wordpress
sleep 2
kubectl rollout restart deployment wordpress
sleep 2
docker exec -it wordpress sh
