# UBUNTU 16.04 LTS
	Disk:
		1) fat32	/boot		256
		2) ext4		/			16384
		3) swap					8192
		4) ext4		/home		...

# GNOME SOFTWARE CENTER
	Install:
		1) sudo apt-get remove software-center
		2) sudo apt-get autoremove software-center
		3) sudo apt install gnome-software


# NVIDIA DRIVERS
	Install:
		1) sudo add-apt-repository ppa:graphics-drivers/ppa
		2) sudo apt-update
		3) sudo apt-get install nvidia-384 nvidia-settings
		4) sudo nvidia-xconfig


# TOUCHPAD GESTURES
	Install:
		1) sudo apt install libinput-tools xdotool
		2) git clone http://github.com/bulletmark/libinput-gestures
		3) cd libinput-gestures
		4) sudo make install
		5) sudo gpasswd -a $USER input  # Log out and back in to assign this group
		6) libinput-gestures-setup autostart
	Settings:
		1) sudo gedit /etc/libinput-gestures.conf
		2) libinput-gestures-setup restart
	Default:
		gesture swipe up	_internal ws_up
		gesture swipe down	_internal ws_down
		gesture swipe left	4 xdotool key alt+Right
		gesture swipe right	4 xdotool key alt+Left
		gesture swipe up	4 xdotool key super+W
		gesture swipe down	4 xdotool key ctrl+alt+0
		gesture pinch in	xdotool key ctrl+super+Down
		gesture pinch out	xdotool key ctrl+super+Up
		gesture swipe up	3 xdotool key ctrl+alt+Down
		gesture swipe down	3 xdotool key ctrl+alt+Up
		gesture swipe right	3 xdotool key ctrl+alt+Left
		gesture swipe left	3 xdotool key ctrl+alt+Right


# TOUCHPAD CALIBRATION
	Install:
		1) sudo touch ~/touchpad_settings.sh
		2) chmod +x ~/touchpad_settings.sh
		3) gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/touchpad_settings.sh"
	Settings:
		1) sudo gedit ~/touchpad_settings.sh
	Default:
		#!/bin/bash
		synclient FingerLow=30
		synclient FingerHigh=40
		synclient MinSpeed=1.6
		synclient MaxSpeed=2.1
		synclient VertScrollDelta=-55
		synclient HorizScrollDelta=-55


# BOTTOM LAUNCH BAR
	Install:
		1) sudo apt-add-repository ppa:docky-core/stable
		2) sudo apt-get update
		3) sudo apt-get install plank
	Settings:
		1) Alt + F2
		2) plank --preferences


# DARK THEME & TWEAK TOOL
	Install:
		1) sudo apt install unity-tweak-tool
		2) sudo add-apt-repository ppa:noobslab/themes
		3) sudo apt-get update
		4) sudo apt-get install arc-theme

# ADDONS
	1) Visual Studio Code
	2) Android Studio + Genymotion
	3) IntelliJI IDEA Community Edition
	4) Google Chrome
