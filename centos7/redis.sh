#!/bin/bash

echo "拉取 redis 镜像"
docker pull redis:6

echo "创建 redis 相关目录"
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/redis/conf
# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/redis/data

echo "运行redis"
tee /home/docker/redis/conf/redis.conf <<-'EOF'
port 6379
bind 0.0.0.0
protected-mode no
requirepass 123456
appendonly yes
EOF

docker run -d --name redis \
  -p 6379:6379 \
  --restart=always -e TZ=Asia/Shanghai \
  -v /home/docker/redis/data:/data \
  -v /home/docker/redis/conf/redis.conf:/etc/redis/redis.conf \
  redis:6 redis-server /etc/redis/redis.conf

echo "开放端口"
firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --reload