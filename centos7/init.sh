#!/bin/bash

# ssh-keygen -t rsa -C "heweiming89@163.com"
# cat ~/.ssh/id_rsa.pub
#cd /usr/local/src

# yum install -y git

# git clone git@github.com:heweiming89/shell.git

#cd shell/centos7

# docker
chmod +x ./*.sh
# jdk
chmod +x ./jdk.sh
# maven
chmod +x ./maven.sh

chmod +x ./mysql.sh

chmod +x ./redis.sh

chmod +x ./nginx.sh

chomd +x ./minio.sh

chmod +x ./nexus3.sh

chmod +x ./jenkins.sh

chmod +x ./mssql.sh

chmod +x ./gitlab-ce.sh

sh ./docker.sh

sh ./jdk.sh

sh ./maven.sh

sh ./mysql.sh

sh ./redis.sh

sh ./nginx.sh

sh ./minio.sh

sh ./nexus3.sh

sh ./jenkins.sh

sh ./mssql.sh

sh ./gitlab-ce.sh

