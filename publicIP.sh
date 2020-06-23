#!/bin/sh

line=$(curl http://ipecho.net/plain)
curdate=$(date)
#TODO change the ips.log file location
echo "$curdate, $line" >> /home/osmc/ips.log
