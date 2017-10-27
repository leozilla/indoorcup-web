#!/bin/bash
set -e

dockerize -t leozilla/indoorcup-web \
   --add-file ../index.html /www/ \
   --add-file ../img/logo.jpg /www/img \
   --entry '/bin/busybox' \
   --cmd 'httpd -f -p 80 -h /www' \
   --cmd 'mkdir -p /www/img' \
   /bin/busybox
