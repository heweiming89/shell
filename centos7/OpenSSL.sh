#!/bin/bash

cd /usr/local/src

yum install -y wget gcc

wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz

tar -zxvf openssl-1.1.1k.tar.gz

mkdir -p /usr/local/openssl

cd openssl-1.1.1k

./config --prefix=/usr/local/openssl

make && make install

mv -f /usr/bin/openssl /usr/bin/openssl.old
mv -f /usr/lib64/openssl /usr/lib64/openssl.old
mv -f /usr/lib64/libssl.so /usr/lib64/libssl.so.old
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
ln -s /usr/local/openssl/include/openssl /usr/include/openssl
ln -s /usr/local/openssl/lib/libssl.so /usr/lib64/libssl.so
echo "/usr/local/openssl/lib" >> openssl version
ldconfig -v

openssl version

: << !

1.使用openssl生成私钥和公钥

openssl下载地址：http://www.openssl.org/source

openssl生成私钥命令：openssl genrsa -out rsa_private_key.pem 1024

openssl生成公钥命令：openssl rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem

2.此时在文件夹可以看到 rsa_private_key.pem 和 rsa_public_key.pem 两个文件。这时候的私钥是不能直接使用的，需要进行 pkcs8 编码

openssl的pkcs8编码命令：openssl pkcs8 -topk8 -in rsa_private_key.pem -out pkcs8_rsa_private_key.pem -nocrypt

那么在bin文件夹可以看到 pkcs8_rsa_private_key.pem 文件。至此，可用的密钥对已经生成好了，私钥使用pkcs8_rsa_private_key.pem，公钥采用rsa_public_key.pem。

!
