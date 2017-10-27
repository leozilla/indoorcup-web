#!/bin/bash
set -e

dockerize -t leozilla/indoorcup-web \
   --add-file index.html /www/ \
   --entry '/bin/busybox' \
   --cmd 'httpd -f -p 80 -h /www' \
   /bin/busybox
