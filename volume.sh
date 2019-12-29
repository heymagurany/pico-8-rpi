#!/bin/bash

PIN=$1
DIRECTION=$2

gpio export $PIN in
gpio -g mode $PIN up

while true; do
  gpio -g wfi $PIN both
  VALUE=$(gpio -g read $PIN)
  COUNT=0
  while [ $VALUE -eq 0 ]; do
    if [ $COUNT -eq 0 ] || [ $COUNT -gt 3 ]; then
      amixer set PCM 10db$DIRECTION
    fi
    sleep 0.1s
    VALUE=$(gpio -g read $PIN)
    let COUNT=COUNT+1
  done
done
