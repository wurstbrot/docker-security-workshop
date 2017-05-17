#!/bin/bash


sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


mkdir wordpress
echo "
version: '2'

services:

  wordpress:
    restart: always
    image: wordpress
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_PASSWORD: example

  mysql:
    restart: always
    image: mariadb
    environment:
      MYSQL_ROOT_PASSWORD: example
" >> wordpress/docker-compose.yml
cd wordpress 
sudo docker-compose up -d

cd 
cd wordpress 
docker-compose rm
cd /vagrant/docker
docker build -t leia .


function generateDockerStart {
echo "sudo docker run \
  --rm -ti \
  --privileged \
  -v /:/rootfs \
  --oom-kill-disable \
  leia \
  $1" > $1.bash
chmod 755 $1.bash
}

cd /home/ubuntu
generateDockerStart lightsaber
generateDockerStart cryoBanGrenade
generateDockerStart smokeGrenade
generateDockerStart flashBangGrenade
generateDockerStart thermalDetonator
generateDockerStart e-11-blaster


docker run -d -p 8084:8080 alkacon/opencms-docker:10.5.1

#rm -R .


#docker run --rm --volumes-from security -v `pwd`/backup:/backup  busybox cp /forkbomb /backup


 
