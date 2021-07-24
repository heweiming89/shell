#!/bin/bash

: <<!

  <server>
    <id>poweritech-releases</id>
    <username>admin</username>
    <password>admin@123</password>
    </server>
  <server>

  <server>
    <id>poweritech-snapshots</id>
    <username>admin</username>
    <password>admin@123</password>
    </server>
  <server>

  <server>
    <id>poweritech-3rd</id>
    <username>admin</username>
    <password>admin@123</password>
  </server>

!

mvn deploy:deploy-file -DgroupId=com.dingtalk.oapi -DartifactId=taobao-sdk-java-auto -Dversion=1479188381469-20210707 -Dpackaging=jar -Dfile=./taobao-sdk/taobao-sdk-java-auto_1479188381469-20210707.jar -Durl=http://172.18.1.144:8081/repository/poweritech-3rd/ -DrepositoryId=poweritech-3rd

mvn deploy:deploy-file -DgroupId=com.dingtalk.oapi -DartifactId=taobao-sdk-java-auto-source -Dversion=1479188381469-20210707 -Dpackaging=jar -Dfile=./taobao-sdk/taobao-sdk-java-auto_1479188381469-20210707-source.jar -Durl=http://172.18.1.144:8081/repository/poweritech-3rd/ -DrepositoryId=poweritech-3rd

mvn deploy:deploy-file -DgroupId=cn.yozo -DartifactId=java-sdk -Dversion=20210122_143127_330710 -Dpackaging=jar -Dfile=./cn.yozo/20210122_143127_330710.jar -Durl=http://172.18.1.144:8081/repository/poweritech-3rd/ -DrepositoryId=poweritech-3rd

mvn deploy:deploy-file -DgroupId=info.monitorenter -DartifactId=cpdetector -Dversion=1.0.10 -Dpackaging=jar -Dfile=./cpdetector_1.0.10_binary/cpdetector_1.0.10.jar -Durl=http://172.18.1.144:8081/repository/poweritech-3rd/ -DrepositoryId=poweritech-3rd
