#!/usr/bin/env bash
set -e

OLD_CONTAINER_ID=`docker ps | grep indoorcup-web | awk '{print $1}'`
if [ -z "$OLD_CONTAINER_ID" ];
then
    OLD_CONTAINER_ID=`docker ps | grep 0.0.0.0:80 | awk '{print $1}'`
fi

if [ ! -z "$OLD_CONTAINER_ID" ];
then
    echo "Killing container $OLD_CONTAINER_ID"
    docker kill $OLD_CONTAINER_ID
else
    echo "No container to kill"
fi

echo "Starting new container"
docker run -d -p 80:80 leozilla/indoorcup-web

