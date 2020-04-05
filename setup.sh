#! bin/bash

#export MINIKUBE_HOME=~/goinfre
minikube config set vm-driver virtualbox
minikube start --vm-driver=virtualbox
minikube docker-env
eval $(minikube -p minikube docker-env)
#touch pasv.txt
#echo "pasv_address=" | tee pasv.txt | sed "/^pasv_address=/ s/\$/$(minikube ip)/" pasv.txt | tee -a srcs/docker_alpine/vsftpd.conf
#rm pasv.txt
#kubectl create -f srcs/ingress.yml
#minikube addons enable ingress
#docker build -t nginx-alpine ./srcs/nginx/
#kubectl apply -f srcs/service-nginx.yml
#docker build -t test_alpine ./srcs/ftps/
#kubectl apply -f srcs/ftps.yml
#sed -i '' -e '$ d' srcs/docker_alpine/vsftpd.conf
docker build -t wordpress_alpine ./srcs/wordpress/
#kubectl apply -f srcs/wordpress/wordpress.yml
docker build -t mysql_alpine ./srcs/mysql/
#kubectl apply -f srcs/mysql/mysql.yml
docker build -t phpmyadmin_alpine ./srcs/phpmyadmin/
kubectl apply -k ./srcs/
#kubectl delete -n default deployment wordpress
#kubectl apply -f srcs/wordpress-deployment.yaml
minikube dashboard
