#!/bin/sh
echo "[INSTALL TOUCHPAD TOUCHPAD CALIBRATION]"
cp -b ./utils/touchpad_settings.sh ~/.config/
chmod +x ~/.config/touchpad_settings.sh
gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/.config/touchpad_settings.sh"
