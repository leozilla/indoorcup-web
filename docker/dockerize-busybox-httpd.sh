#!/bin/bash
set -e

dockerize -t leozilla/indoorcup-web \
   --cmd 'mkdir -p /www/img' \
   --add-file ../index.html /www/ \
   --add-file ../img/logo.jpg /www/img \
   --entry '/bin/busybox' \
   --cmd 'httpd -f -p 80 -h /www' \
   /bin/busybox
