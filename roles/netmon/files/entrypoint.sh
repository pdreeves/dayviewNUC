#!/bin/bash

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
   			i=$[$i+1]
   			sleep 240
		 done 
		speedtest --server-id=1768 -f json -p no -u Mbps
	done;;
  bash)
  /bin/bash
esac