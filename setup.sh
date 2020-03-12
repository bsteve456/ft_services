#! bin/bash

export MINIKUBE_HOME=~/goinfre
minikube config set vm-driver virtualbox
minikube start
minikube docker-env
eval $(minikube -p minikube docker-env)
touch pasv.txt
echo "pasv_address=" | tee pasv.txt | sed "/^pasv_address=/ s/\$/$(minikube ip)/" pasv.txt | tee -a srcs/docker_alpine/vsftpd.conf
rm pasv.txt
kubectl create -f srcs/ingress.yml
minikube addons enable ingress
docker build -t nginx-alpine ./srcs/nginx_alpine/
kubectl apply -f srcs/service-nginx.yml
docker build -t test_alpine ./srcs/docker_alpine/
kubectl apply -f srcs/ftps.yml
sed -i '' -e '$ d' srcs/docker_alpine/vsftpd.conf
minikube dashboard
