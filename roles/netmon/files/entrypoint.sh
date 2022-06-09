#!/bin/sh

set -e


case "$1" in
  netmon)
    while true; do
    	i="0"
    	while [ $i -lt 96 ]; do
   			mtr --report -c 5 -i 1 -4 -n 8.8.8.8
   			sleep 5
   			mtr --report -c 5 -i 1 -4 -n 208.67.222.222
   			sleep 5
   			mtr --report -c 5 -i 1 -4 -n 13.33.25.126
   			sleep 5
   			i=`expr $i + 1`
   			sleep 240
		 done 
		speedtest --json
	done;;
  bash)
  /bin/bash
esac