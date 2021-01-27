eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)
ssh-keygen -f "/home/sfcdota/.ssh/known_hosts" -R "192.168.99.114"

docker rm -f $(docker ps -a -q) && docker build -t nginx srcs/nginx/ && kubectl rollout restart deployment

kubectl exec -it $(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')     -- pkill nginx

#ftps check connection
nc -zv 172.17.0.2 21
ftp 172.17.0.2
docker build -t ftps . && docker run -dit -p 21:21 -p 22800-23000:22800-23000 --name=ftps ftps


lastoctet=$(echo $(minikube ip) | grep -Eo "[0-9]+$")
lastoctet=$(($lastoctet + 1))
echo $(echo $(minikube ip) | sed "s/[0-9]\{3,\}$/"$lastoctet"228/g")


kubectl get svc | grep ftps | grep -Eo $(echo $(minikube ip) | sed -e "s/\.[0-9]\+$//")".[0-9]+"


export IP=$(minikube ip)
cub=$(echo $IP | grep -Eo "[0-9]+$")
IP=$(echo $IP | sed -e "s/\.[0-9]\+$//")
nmap -sP -PR $IP.$cub | grep "Host is up"
while [ "$?" != 1 ]
do
    cub=$(($cub + 1))
    nmap -sP -PR $IP.$cub | grep "Host is up"
done
IP="$IP.$cub"


	Изменeния ip, портов и образа допускаются БЕЗ удаления предудщей сущности ( deploy, pod, svc) apply - f напишет вам "**" changed
, значит ваши изменения применились. Если же выводит ошибку , значит точно удаляйте , и пробуйте добавить заново.
	Для перезапуска metallb НЕ НУЖНО перезапускать миникуб. досаточно перезапустить саму metallb ( неожиданно, не правдали ? )
addons disable && addons enable . Каждый раз после этого и КАЖДЫЙ РАЗ ПОСЛЕ СТАРТА миникуба нужно применять конфиг.
	Иначе, даже если он вам показывает external ip  - по факту он работать не будет.
Для небольших именений на уровне "а если так ?" не нужно пересобирать контейнер -
залезьте внутрь kubectl exec -it *** sh и пропишите всё что вам нужно ручками ( для этого добавите нано или вим в сборку)
	Даже если вы пересобрали докер образ, НЕ НУЖНО удалять deploy .
Достаточно удалить под, или сделать kubectl rollout restart deployment
и он подхватит новый образ сам ( для этого не забываем eval $(minikube docker-env)
внутри каждой коносли в которой работаем. проверить к чему подключен докер проще всего docker ps


docker run -dit --name=nginx -p 8080:80 -p 443:443 nginx && docker container ls

docker run -dit -p 21:21 ftps && docker container ls

kubectl exec -it [pod name] -- bash


sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" nginx
