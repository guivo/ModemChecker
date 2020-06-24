#!/bin/sh
outfile=$1
line=$(curl http://ipecho.net/plain)
curdate=$(date +%Y%m%dT%H%M%S)
echo "$curdate, $line" >> $outfile
