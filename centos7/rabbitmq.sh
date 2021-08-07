#!/bin/bash

docker pull rabbitmq:3.8-management
mkdir -m 777 -p /home/docker/rabbitmq/data
mkdir -m 777 -p /home/docker/rabbitmq/conf

docker run -d --name rabbitmq \
  -e TZ=Asia/Shanghai \
  --privileged=true --restart=always \
  -v /home/docker/rabbitmq/data:/var/lib/rabbitmq \
  -v /home/docker/rabbitmq/conf:/etc/rabbitmq \
  -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin@123 \
  rabbitmq:3.8-management

yum install wget -y

mkdir -p /usr/local/src/rabbitmq
cd /usr/local/src/rabbitmq
wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.8.17/rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez
docker cp rabbitmq_delayed_message_exchange-3.8.17.8f537ac.ez rabbitmq:/plugins

docker exec -it rabbitmq rabbitmq-plugins enable rabbitmq_management
docker exec -it rabbitmq rabbitmq-plugins enable rabbitmq_delayed_message_exchange
docker exec -it rabbitmq rabbitmq-plugins list

docker restart rabbitmq

echo "开放端口"
firewall-cmd --zone=public --add-port=5672/tcp --permanent
firewall-cmd --zone=public --add-port=15672/tcp --permanent
firewall-cmd --reload
