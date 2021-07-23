#!/bin/bash

echo "拉取 gitlab-ce 镜像"
docker pull gitlab/gitlab-ce

mkdir -m 777 -p /home/docker/gitlab-ce/etc
mkdir -m 777 -p /home/docker/gitlab-ce/log
mkdir -m 777 -p /home/docker/gitlab-ce/opt

docker run -d --name gitlab-ce \
  -p 9080:80 \
  -p 9022:22 \
  --privileged=true \
  --restart=always \
  -v /home/docker/gitlab-ce/etc:/etc/gitlab \
  -v /home/docker/gitlab-ce/log:/var/log/gitlab \
  -v /home/docker/gitlab-ce/opt:/var/opt/gitlab \
  gitlab/gitlab-ce

echo "修改 gitlab root 密码"
docker exec -it gitlab-ce bash -c "
  gitlab-rails console -e production \
  user = User.where(id: 1).first \
  user.password = 'admin@123' \
  user.password_confirmation = 'admin@123' \
  user.save!
"