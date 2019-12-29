# Gamepad

Button|Raspberry Pi
------|------------
LEFT  |GPIO5
RIGHT |GPIO6
UP    |GPIO19
DOWN  |GPIO26
O     |GPIO16
X     |GPIO20
START |GPIO21

## Install Retrogame

    curl https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/retrogame.sh > retrogame.sh

## Configure Retrogame

    $ sudo bash retrogame.sh

Select "Two buttons + joystick"

    $ sudo vi /boot/retrogame.cfg

Map buttons to GPIOs

    LEFT       5  # Joypad left
    RIGHT      6  # Joypad right
    UP        19  # Joypad up
    DOWN      26  # Joypad down
    Z         16  # 'O' button
    X         20  # 'X' button
    ESC       21  # Start button

## Run Retrogame on startup

Add this to `/etc/rc.local` after `fbcp &` and before `exit 0`

    /usr/local/bin/retrogame &
