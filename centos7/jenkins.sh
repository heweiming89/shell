#!/bin/bash

echo "安装maven"
yum install -y wget

wget -P /usr/local/maven https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
cd /usr/local/maven && tar -zxvf apache-maven-3.8.1-bin.tar.gz && rm -f apache-maven-3.8.1-bin.tar.gz

echo "拉取jenkins 镜像"
docker pull jenkins/jenkins:lts-jdk11

# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/jenkins

docker run -d --name jenkins -u root \
  --privileged=true --restart=always \
  -p 8080:8080 -p 50000:50000 \
  -e JAVA_OPTS="-Duser.timezone=GMT+08" \
  -v /etc/localtime:/etc/localtime \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/local/maven/apache-maven-3.8.1:/usr/local/maven \
  -v /home/docker/jenkins:/var/jenkins_home \
  jenkins/jenkins:lts-jdk11

# 查看密码
# docker exec -it jenkins /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"

# jenkins 镜像中已经包含了jdk，我们只不过把容器中这些工具的路径找出来，配置下路径即可
# 先进入 jenkins 的容器中
# docker exec -it jenkins容器id /bin/bash
# jdk
# 然后通过echo $JAVA_HOME来查看 java 路径在/usr/local中，然后配置进 jenkins 的 JAVA_HOME 中即可