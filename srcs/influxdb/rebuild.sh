eval $(minikube docker-env)
# kubectl delete -f mysql.yaml
# kubectl delete $(kubectl get pods -o name | grep mysql)
docker rm -f $(docker ps -f "name=influxdb" --format "{{.ID}}")
docker rmi -f influxdb
docker build -t influxdb .
# kubectl apply -f mysql.yaml
sleep 5
docker exec -it $(docker ps -f "name=influxdb" --format "{{.ID}}") sh
# kubectl exec -it $(kubectl get pods -o name | grep mysql) -- sh
