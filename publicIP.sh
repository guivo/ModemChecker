#!/bin/sh
outfile=$1
line=$(curl http://ipecho.net/plain)
if $(wc -l $line) -gt 1; then
  line=""
fi
curdate=$(date +%Y%m%dT%H%M%S)
echo "$curdate, $line" >> $outfile
