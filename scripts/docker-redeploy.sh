#!/usr/bin/env bash
set -e

OLD_RUNNING_CONTAINER_ID=`docker ps | grep indoorcup-web | awk '{print $1}'`
if [ -z "$OLD_RUNNING_CONTAINER_ID" ];
then
    OLD_RUNNING_CONTAINER_ID=`docker ps | grep 0.0.0.0:80 | awk '{print $1}'`
fi

if [ ! -z "$OLD_RUNNING_CONTAINER_ID" ];
then
    echo "Stop container $OLD_RUNNING_CONTAINER_ID"
    docker stop $OLD_RUNNING_CONTAINER_ID
else
    echo "No container to stop"
fi


OLD_CONTAINER_ID=`docker ps -a | grep indoorcup-web | awk '{print $1}'`
if [ ! -z "$OLD_CONTAINER_ID" ];
then
    echo "Removing container $OLD_CONTAINER_ID"
    docker rm -f $OLD_CONTAINER_ID
else
    echo "No container to remove"
fi


echo "Starting new container"
docker run -d -p 80:80 --name indoorcup-web leozilla/indoorcup-web

