eval $(minikube docker-env)
# kubectl delete -f mysql.yaml
# kubectl delete $(kubectl get pods -o name | grep mysql)
docker rm -f $(docker ps -f "name=grafana" --format "{{.ID}}")
docker rmi -f grafana
docker build -t grafana .
# kubectl apply -f mysql.yaml
docker run -dit -p 3000:3000 --name=grafana grafana
sleep 5
docker exec -it $(docker ps -f "name=grafana" --format "{{.ID}}") sh
# kubectl exec -it $(kubectl get pods -o name | grep mysql) -- sh
