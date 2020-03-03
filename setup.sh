export MINIKUBE_HOME=~/goinfre
minikube config set vm-driver virtualbox
minikube start
minikube docker-env
eval $(minikube -p minikube docker-env)
export MINI_IP=`minikube ip`
touch pasv.txt | echo "pasv_address=" | tee pasv.txt
sed -i '' -e '$ d' srcs/docker_alpine/vsftpd.conf
sed "/^pasv_address=/ s/\$/$MINI_IP/" pasv.txt | tee pasv.txt | tee -a srcs/docker_alpine/vsftpd.conf
rm pasv.txt
bash srcs/ssl.sh
#bash srcs/docker_alpine/ftps_ssl.sh
kubectl create -f srcs/ingress.yml
minikube addons enable ingress
kubectl apply -f srcs/service-nginx.yml
docker build -t test_alpine ./srcs/docker_alpine/
kubectl apply -f srcs/ftps.yml
#rm srcs/docker_alpine/vsftpd.pem
minikube dashboard
