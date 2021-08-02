#!/bin/bash

echo "拉取sqlserver 2017 镜像"
docker pull mcr.microsoft.com/mssql/server:2017-latest

echo "创建[sqlserver]相关目录"
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/mssql/

echo "启动 mssql"
docker run -it -d --name mssql \
  -p 1433:1433 \
  --restart=always \
  -e 'ACCEPT_EULA=Y' \
  -e 'SA_PASSWORD=Admin@123' \
  -v /home/docker/mssql:/var/opt/mssql \
  mcr.microsoft.com/mssql/server:2017-latest

echo "开放端口"
firewall-cmd --zone=public --add-port=1433/tcp --permanent
firewall-cmd --reload

