#!/usr/bin/env bash
set -e

cd ..
make build test push

OLD_CONTAINER_ID=${docker ps | grep leozilla/indoorcup-web | awk '{print $1}'}
docker kill $OLD_CONTAINER_ID

docker run -d -p 80:80 leozilla/indoorcup-web

