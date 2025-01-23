#!/bin/bash

service ssh start
echo -e "\033[0;32mTor service starting...\033[0m"
tor -f /etc/tor/torrc &

if ! ps aux | grep -q '[t]or'; then
    echo -e "\033[0;31mTor service error!\033[0m"
    exit 1
fi

while [ ! -f /var/lib/tor/hidden_service/hostname ]; do
    echo -e "\033[0;33m/var/lib/tor/hidden_service/hostname file not found!\033[0m"
    sleep 1
done
echo -e "\033[0;32m/var/lib/tor/hidden_service/hostname file found!\033[0m"

chown -R torUser:torUser /etc/tor /var/lib/tor /var/log/tor
echo -e "\033[0;32mowner changed!\033[0m"
sleep 2

nginx -g 'daemon off;'
