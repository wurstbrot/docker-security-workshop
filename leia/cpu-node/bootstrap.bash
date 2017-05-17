#!/bin/bash

cd /tmp/cpu-node
docker build -t nodejsapp .
echo "
docker run -d  --name nodejsapp -p 3000:3000 nodejsapp
" > /home/ubuntu/A280.bash
chmod 755 /home/ubuntu/A280.bash
