# Powering the Pi

Button      |Raspberry Pi
------------|------------
Power       |GPIO23

Download the volume script

    $ cd ~
    $ wget https://raw.githubusercontent.com/heymagurany/pico-8-rpi/master/power.sh

Make the volume script executable

    $ chmod 744 power.sh

To run the volume script at startup, add this to `/etc/rc.local` after `fbcp &` and before `exit 0`

    /home/pi/power.sh 23

## Source

* https://github.com/NeonHorizon/lipopi