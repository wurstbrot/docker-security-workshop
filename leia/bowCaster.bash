#!/bin/bash
for i in `seq 1 7`; do
mkdir /home/ubuntu/wordpress-$i
cd /home/ubuntu/wordpress-$i
echo "
version: '2'

services:

  wordpress:
    restart: always
    image: wordpress
    ports:
      - 805$i:80
    environment:
      WORDPRESS_DB_PASSWORD: example
    volumes:
      - ./html:/var/www/html

  mysql:
    restart: always
    image: mariadb
    volumes:
      - ./db-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
" >> docker-compose.yml
cp -a /home/ubuntu/db-data .
sudo docker-compose up -d
cd
done
