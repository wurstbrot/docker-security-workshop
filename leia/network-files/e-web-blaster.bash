docker run --name=opencms --restart=always -d -p 8084:8080 alkacon/opencms-docker:10.5.1
docker run -d -p 8089:80 special
sleep 35
docker exec -t opencms  sh -c "mysql -u root -p'admin' -e \"CREATE USER 'opencms'@'%' IDENTIFIED BY 'opencms';\" opencms"
docker exec -t opencms  sh -c "mysql -u root -p'admin' -e \"GRANT ALL ON *.* to opencms@'%'\""
docker exec -t opencms  sh -c "mysql -u root -p'admin' -e 'FLUSH PRIVILEGES'"
docker exec -t opencms  sh -c "sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf"
docker exec -t opencms  sh -c "/etc/init.d/mysql restart"


