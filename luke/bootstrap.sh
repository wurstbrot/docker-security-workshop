#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo yum install -y setools-console
sudo systemctl restart docker
