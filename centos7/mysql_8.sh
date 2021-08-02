#!/bin/bash

docker pull mysql:8

mkdir -m 777 -p /home/docker/mysql_8/data


docker run -d --name mysql_8 \
  -p 3306:3306 \
  --privileged=true --restart=always \
  -v /home/docker/mysql_8/data:/var/lib/mysql \
  -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
  -e MYSQL_ROOT_PASSWORD=admin@123 \
  mysql:8 --lower_case_table_names=1


# mysql 8
# 修改密码
# alter user 'root'@'localhost' identified by 'Admin@123';
#
