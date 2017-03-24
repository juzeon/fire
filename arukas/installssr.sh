#!/bin/bash

#Install ShadowsocksR with net speeder
#For debian/ubuntu
apt-get update #run on arukas
apt-get clean
apt-get install -y python python-pip python-m2crypto libnet1-dev libpcap0.8-dev gcc zip unzip wget
cd /root/
#git clone -b manyuser https://github.com/breakwa11/shadowsocks.git ssr
wget -O ssr.zip https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
unzip ssr.zip
wget -O netspeeder.zip https://github.com/snooda/net-speeder/archive/master.zip
unzip netspeeder.zip
#git clone https://github.com/snooda/net-speeder.git net-speeder
cd net-speeder-master
sh build.sh
mv net_speeder /usr/local/bin/
chmod +x /usr/local/bin/net_speeder
nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
nohup /usr/bin/python /root/shadowsocksr-manyuser/shadowsocks/server.py -s 0.0.0.0 -p 5454 -k 111111 -m rc4-md5 -o http_simple -O auth_sha1 2>&1 &
