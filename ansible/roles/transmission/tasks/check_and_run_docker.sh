#!/bin/bash

CONTAINER_NAME=$1
OPENVPN_PROVIDER=$2
OPENVPN_CONFIG=$3
OPENVPN_USERNAME=$4
OPENVPN_PASSWORD=$5
LOCAL_NETWORK=$6

if docker ps | grep -q "$CONTAINER_NAME"; then
    echo "container already running"
else
    docker run --cap-add=NET_ADMIN -d \
    --device /dev/net/tun \
    -v /media/toshiba-ext-hdd/data/:/data \
    -v /media/toshiba-ext/config/:/config \
    -e OPENVPN_PROVIDER=$OPENVPN_PROVIDER \
    -e OPENVPN_CONFIG=$OPENVPN_CONFIG \
    -e OPENVPN_USERNAME=$OPENVPN_USERNAME \
    -e OPENVPN_PASSWORD=$OPENVPN_PASSWORD \
    -e LOCAL_NETWORK=$LOCAL_NETWORK \
    --log-driver json-file \
    --log-opt max-size=10m \
    -p 9091:9091 \
    --restart unless-stopped \
    --network transmission \
    haugene/$CONTAINER_NAME
fi
