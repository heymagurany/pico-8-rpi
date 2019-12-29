# Audio

Channel       |Raspberry Pi
--------------|------------
Left Channel  |GPIO13
Right Channel |GPIO18

Add a device tree overlay to `/boot/config.txt`

    # Audio
    dtoverlay=pwm-2chan,pin=18,func=2,pin2=13,func2=4

## Volume Control

Button      |Raspberry Pi
------------|------------
Volume Up   |GPIO17
Volume Down |GPIO27

Download the volume script

    $ cd ~
    $ wget https://raw.githubusercontent.com/heymagurany/pico-8-rpi/master/volume.sh

Make the volume script executable

    $ chmod 744 volume.sh

To run the volume script at startup, add this to `/etc/rc.local` after `fbcp &` and before `exit 0`

    /home/pi/volume.sh 17 + &
    /home/pi/volume.sh 27 - &

## Sources

* https://learn.adafruit.com/adding-basic-audio-ouput-to-raspberry-pi-zero/overview
* https://gist.github.com/ChickenProp/3050085
* http://wiringpi.com/the-gpio-utility/
