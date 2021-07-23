docker pull sonatype/nexus3:3.31.1

# shellcheck disable=SC2174
mkdir -m 777 -p /home/docker/nexus3/data

docker run -d --name nexus3 \
  -p 8081:8081 \
  --privileged=true --restart=always \
  -v /home/docker/nexus3/data:/nexus-data \
  sonatype/nexus3:3.31.1

echo "开放端口"
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --reload
