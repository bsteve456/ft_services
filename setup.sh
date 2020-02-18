export MINIKUBE_HOME=~/goinfre
minikube config set vm-driver virtualbox
minikube start
minikube docker-env
eval $(minikube -p minikube docker-env)
bash srcs/ssl.sh
kubectl create -f /Users/stbaleba/42_Circle_3/github_service/srcs/ingress.yml
minikube addons enable ingress
kubectl apply -f srcs/service-nginx.yml
docker build -t test_alpine ./srcs/docker_alpine/
kubectl apply -f srcs/ftps.yml
minikube dashboard
