docker rm -f $(docker ps -f "name=phpmyadmin" --format "{{.ID}}")
docker build -t phpmyadmin .
docker run -dit --name=phpmyadmin -p 3306:3306  phpmyadmin
sleep 2
kubectl rollout restart deployment phpmyadmin
sleep 2
docker exec -it phpmyadmin sh
