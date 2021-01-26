lastoctet=$(echo $(minikube ip) | grep -Eo "[0-9]+$")
lastoctet=$(($lastoctet + 1))
freeipstart=$(echo $(minikube ip) | sed "s/[0-9]\{3,\}$/"$lastoctet"/g")
freeipend=$(echo $(minikube ip) | sed "s/[0-9]\{3,\}$/"$(($lastoctet + 10))"/g")
echo "minikube ip = $(minikube ip)\nFirst free ip in minikube subnet = $freeipstart"
echo "changing metallb config to working properly with random minikube ip..."
sed -i "s/IPRANGE/"$freeipstart"-"$freeipend"/g" srcs/metallb/metallb.yaml
echo "iprange is now set"
