# Audio

Add a device tree overlay to `/boot/config.txt`

    # Audio
    dtoverlay=pwm-2chan,pin=18,func=2,pin2=13,func2=4

## Volume Control

Download the volume script

    # TODO

Make the volume script executable

    $ chmod 744 volume.sh

To run the volume script at startup, add this to `/etc/rc.local` after `fbcp &` and before `exit 0`

    /home/pi/volume.sh 17 + &
    /home/pi/volume.sh 27 - &

## Sources

* https://learn.adafruit.com/adding-basic-audio-ouput-to-raspberry-pi-zero/overview
* https://gist.github.com/ChickenProp/3050085
* http://wiringpi.com/the-gpio-utility/
