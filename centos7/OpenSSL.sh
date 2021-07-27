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