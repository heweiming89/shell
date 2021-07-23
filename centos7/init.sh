#!/bin/bash

cd /usr/local/src

git clone git@github.com:heweiming89/shell.git

cd shell/centos7

# docker
chmod +x ./*.sh
# jdk
chmod +x ./jdk.sh
# maven
chmod +x ./maven.sh

chmod +x ./mysql.sh

chmod +x ./reids.sh

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

sh ./reids.sh

sh ./nginx.sh

sh ./minio.sh

sh ./nexus3.sh

sh ./jenkins.sh

sh ./mssql.sh

sh ./gitlab-ce.sh

