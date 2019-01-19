#!/bin/sh
echo "[RE-INSTALL GNOME SOFTWARE CENTER]"
sudo apt-get remove gnome-software
sudo apt-get autoremove
sudo apt-get install gnome-software
