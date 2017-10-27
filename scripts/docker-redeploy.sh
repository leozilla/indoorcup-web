#!/usr/bin/env bash
set -e

cd ..
make build test push

OLD_CONTAINER_ID=`docker ps | grep indoorcup-web | awk '{print $1}'`
if [ ! -z "$OLD_CONTAINER_ID" ];
then
    docker kill $OLD_CONTAINER_ID
fi

docker run -d -p 80:80 leozilla/indoorcup-web --name indoorcup-web

