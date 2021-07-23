#!/bin/bash

# 如有安装jdk 需先卸载
# 查看 rpm -qa | grep java
# 或 rpm -qa | grep jdk

# openjdk 下载地址
# http://jdk.java.net/archive/
# oracle jdk 11 下载地址（注意要用浏览器下载）
# https://download.oracle.com/otn-pub/java/jdk/11.0.12%2B8/f411702ca7704a54a79ead0c2e0942a3/jdk-11.0.12_linux-x64_bin.rpm

yum install -y wget

echo "切换到 /usr/local/src"
cd /usr/local/src

echo "下载 oracle jdk"
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/11.0.12%2B8/f411702ca7704a54a79ead0c2e0942a3/jdk-11.0.12_linux-x64_bin.rpm

echo "安装 oracle jdk"
rpm -ivh jdk-11.0.12_linux-x64_bin.rpm

echo "配置环境变量"

sed -i '$a \export JAVA_HOME=/usr/java/jdk-11.0.12' /etc/profile
sed -i '$a \export CLASSPATH=$JAVA_HOME/jre/lib/rt.jar:\$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' /etc/profile
sed -i '$a \export PATH=$PATH:$JAVA_HOME/bin' /etc/profile

source /etc/profile

java -version