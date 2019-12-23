# Setup PICO-8 on a Raspberry Pi

## Install Prerequisites

    $ sudo apt-get install libasound2-dev wiringpi
    $ wget https://t.co/jZy96cDeCC?amp=1 -O sndio-1.2.0.tar.gz
    $ tar -xf sndio-1.2.0.tar.gz
    $ cd sndio-1.2.0
    $ ./configure
    $ make
    $ sudo make install

## Copy PICO-8 to the Pi

    $ scp pico-8_0.1.12c_raspi.zip pi@192.168.1.106:~/

Inflate the file to a `pico-8` directory

    $ unzip pico-8_0.1.12c_raspi.zip

## Run PICO-8 on startup

Add this to `/etc/rc.local` after `fbcp &` and before `exit 0`

    /home/pi/pico-8/pico8 -splore &
