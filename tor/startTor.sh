#!/bin/sh
while [ ! -f /var/lib/tor/hidden_service/hostname ]; do
    sleep 1
done
cat /var/lib/tor/hidden_service/hostname
# Diğer işlemleriniz