#!/bin/bash

echo "开始安装nginx"

echo "拉取nginx镜像"
docker pull nginx:stable

echo "创建nginx相关目录"
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/nginx
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/nginx/conf.d
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/nginx/html

docker run -d --net=host --name nginx \
  --privileged=true --restart=always \
  nginx:stable

echo "copy nginx 配置文件"
docker cp nginx:/etc/nginx/nginx.conf /home/docker/nginx/nginx.conf
docker cp nginx:/etc/nginx/conf.d/ /home/docker/nginx
docker cp nginx:/usr/share/nginx/html /home/docker/nginx

docker stop nginx && docker rm nginx

echo "启动nginx"
docker run -d --net=host --name nginx \
  --privileged=true --restart=always \
  -v /home/docker/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v /home/docker/nginx/conf.d:/etc/nginx/conf.d \
  -v /home/docker/nginx/html:/usr/share/nginx/html \
  nginx:stable