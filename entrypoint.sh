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
echo -e "\033[0;32mOwner changed!\033[0m"
sleep 2

rm -rf /home/torUser/entrypoint.sh
echo -e "\033[0;32mEntrypoint.sh deleted!\033[0m"

echo -e "ONION URL: "
echo -e "\033[1m\033[0;33m$(cat /var/lib/tor/hidden_service/hostname)\033[0m"

# Ensure nginx runs in the foreground, allowing terminal outputs to continue
nginx -g 'daemon off;'
