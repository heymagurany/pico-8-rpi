# Attatching a Waveshare 1.5" RGB OLED Module to a Raspberry Pi 3 B+

## Connecting Hardware to GPIO

https://www.waveshare.com/wiki/1.5inch_RGB_OLED_Module

Module|Raspberry Pi
------|-----------
VCC   |3V3 
GND   |GND
DIN   |GPIO10 MOSI
CLK   |GPIO11 SCLK
CS    |GPIO8 CE0
DC    |GPIO24
RST   |GPIO25

## Install Prerequisites

    $ sudo apt-get update
    $ sudo apt-get upgrade
    $ sudo apt-get install git cmake

## Install the Broadcom BCM 2835 Library

https://www.airspayce.com/mikem/bcm2835/

Copy the tarball to the pi

    $ scp bcm2835-1.60.tar.gz pi@192.168.1.106:~/

Install in on the pi

    $ tar zxvf bcm2835-1.xx.tar.gz
    $ cd bcm2835-1.xx
    $ ./configure
    $ make
    $ sudo make check
    $ sudo make install

## Configure Raspberry Pi

### Enable SPI on boot

Uncomment the following lines in `/boot/config.txt` and change the frame buffer dimensions to 128x128

    dtparam-spi=on
    framebuffer_width=128
    framebuffer_height=128

### Add module for the display

Create a `modprobe` configuration file

    $ sudo vi /etc/modprobe.d/fbtft.conf

Add the following line:

    options fbtft_device name=pioled gpios=reset:25,dc:24

Create a module file

    $ sudo vi /etc/modules-load.d/fbtft.conf

Add the following lines:

    spi-bcm2835
    fbtft_device

### Map the console to the new frame buffer

    $ sudo vi /boot/config.txt

Add some HDMI config.

    # Added for TFT Display
    hdmi_group=2
    hdmi_mode=87
    hdmi_cvt=128 128 60 1 0 0 0
    hdmi_force_hotplug=1

## Install Framebuffer Copy

https://github.com/tasanakorn/rpi-fbcp

    $ git clone https://github.com/tasanakorn/rpi-fbcp
    $ cd rpi-fbcp/
    $ mkdir build
    $ cd build/
    $ cmake ..
    $ make
    $ sudo install fbcp /usr/local/bin/fbcp

Add this to `/etc/rc.local` before `exit 0`

    fbcp & # Copy /dev/fb0 to /dev/fb1
    con2fbmap 1 0 # Map console back to /dev/fb0 to avoid the vc => fb0 thing

## Souces
* https://github.com/rm-hull/luma.oled/issues/174
* https://github.com/notro/fbtft/issues/313
* https://github.com/notro/fbtft/wiki
* https://www.youtube.com/watch?v=6C1kVnGUAY0&list=WL&index=14&t=0s
* https://www.lexaloffle.com/bbs/?tid=34934
* http://ozzmaker.com/raspberrypi-tft/