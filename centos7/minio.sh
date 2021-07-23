#!/bin/bash

echo "拉取 minio 镜像"
docker pull minio/minio

echo "创建 minio 相关目录"
mkdir -p /home/docker/minio/data && chmod -R 777 /home/docker/minio/data
mkdir -p /home/docker/minio/config && chmod -R 777 /home/docker/minio/config

echo "运行 minio"
docker run -d --name minio \
  -p 9000:9000 \
  -p 9001:9001 \
  --restart=always \
  -e "MINIO_ROOT_USER=minio" \
  -e "MINIO_ROOT_PASSWORD=admin@123" \
  -v /home/docker/minio/data:/data \
  -v /home/docker/minio/config:/root/.minio \
  minio/minio server /data --console-address ":9001"

echo "开放端口"
firewall-cmd --zone=public --add-port=9000/tcp --permanent
firewall-cmd --zone=public --add-port=9001/tcp --permanent
firewall-cmd --reload
