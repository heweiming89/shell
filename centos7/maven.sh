#!/bin/bash

echo "安装maven"
yum install -y wget

wget -P /usr/local/maven https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
cd /usr/local/maven
tar -zxvf apache-maven-3.8.1-bin.tar.gz
rm -f apache-maven-3.8.1-bin.tar.gz

echo "配置环境变量"
sed -i '$a \export M2_HOME=/usr/local/maven/apache-maven-3.8.1' /etc/profile
sed -i '$a \export PATH=$PATH:$M2_HOME/bin' /etc/profile

source /etc/profile

echo "查看maven 版本"
mvn -v