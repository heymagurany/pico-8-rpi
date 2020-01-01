#!/bin/bash

PIN=$1

gpio export $PIN in
gpio -g mode $PIN up

gpio -g wfi $PIN both
VALUE=$(gpio -g read $PIN)
if [ $VALUE -eq 0 ]; then
  shutdown -h now
fi
