docker rm -f wordpress
docker build -t wordpress .
docker run -dit --name=wordpress -p 5500:5500  wordpress
sleep 5
kubectl rollout restart deployments
docker exec -it wordpress sh
