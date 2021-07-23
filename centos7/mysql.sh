#!/bin/bash

docker pull mysql:5.7

# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/mysql/data

docker run -d --name mysql \
  -p 3306:3306 \
  --privileged=true --restart=always \
  -v /home/docker/mysql/data:/var/lib/mysql \
  -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
  -e MYSQL_ROOT_PASSWORD=123456 \
  mysql:5.7

echo "开放端口"
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

