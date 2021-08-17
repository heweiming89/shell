#!/bin/bash

echo "安装docker"

yum  install -y net-tools yum-utils

yum-config-manager  --add-repo  https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

systemctl restart network

mkdir -p /etc/docker

tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://wh540exz.mirror.aliyuncs.com"]
}
EOF

systemctl enable docker

systemctl daemon-reload && sudo systemctl restart docker
