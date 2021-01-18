docker rm -f phpmyadmin
docker build -t phpmyadmin .
docker run -dit --name=phpmyadmin -p 5000:5000  phpmyadmin
sleep 5
kubectl rollout restart deployments
docker exec -it phpmyadmin sh
