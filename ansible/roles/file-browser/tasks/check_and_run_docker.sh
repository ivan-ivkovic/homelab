#!/bin/bash

FILE_BROWSER_PORT=$1
CONTAINER_NAME=$2
ANSIBLE_USER=$3

if docker ps | grep -q "$CONTAINER_NAME"; then
    echo "container already running"
else
    docker run -d \
        -v /home/$ANSIBLE_USER/.config/filebrowser:/srv \
        -v /home/$ANSIBLE_USER/.config/filebrowser/filebrowser.db:/database.db \
        -v /home/$ANSIBLE_USER/.config/filebrowser/.filebrowser.json:/.filebrowser.json \
        -u $(id -u):$(id -g) \
        -p $FILE_BROWSER_PORT:80 \
        --restart unless-stopped \
        filebrowser/$CONTAINER_NAME
fi
