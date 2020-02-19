openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/vsftpd.pem -out /tmp/vsftpd.pem -subj "/CN=ftps/O=ftps"
kubectl create secret tls ftpssecret --key /tmp/vsftpd.pem --cert /tmp/vsftpd.pem
mv /tmp/vsftpd.pem /Users/stbaleba/42_Circle_3/github_service/srcs/docker_alpine
kubectl get secrets
kubectl create configmap ftpsconfigmap --from-file=srcs/docker_alpine/vsftpd.conf
kubectl get configmaps
