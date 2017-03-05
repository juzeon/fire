#!/bin/bash

#Install ShadowsocksR with net speeder
#For debian/ubuntu
#apt-get update #run on arukas
apt-get clean
apt-get install -y python python-pip python-m2crypto libnet1-dev libpcap0.8-dev git gcc
#cd /root/
git clone -b manyuser https://github.com/breakwa11/shadowsocks.git ssr
#git clone https://github.com/snooda/net-speeder.git net-speeder
#cd /root/net-speeder/
#sh build.sh
#mv net_speeder /usr/local/bin/
#chmod +x /usr/local/bin/net_speeder
#nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
/usr/bin/python /root/ssr/shadowsocks/server.py -s 0.0.0.0 -p 7777 -k 111111 -m rc4-md5 -o http_simple -O auth_sha1 >/dev/null 2>&1 &