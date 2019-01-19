#!/bin/sh
echo "[INSTALL TOUCHPAD GESTURES]"
sudo apt-get install libinput-tools xdotool
git clone git://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo make install
sudo gpasswd -a $USER input
libinput-gestures-setup autostart
cp -b /utils/libinput-gestures.conf /etc/
libinput-gestures-setup restart
rm -r -f libinput-gestures
