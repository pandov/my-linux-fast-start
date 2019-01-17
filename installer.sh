#!/bin/sh
sudo apt update
sudo apt upgrade
sudo apt autoremove

printf "\n[INSTALL APT-FAST]\n\n\n"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt update
sudo apt install apt-fast

printf "\n[INSTALL CPU CONTROLLER]\n\n\n"
# sudo add-apt-repository ppa:linrunner/tlp
# sudo apt-fast update
# sudo apt-fast install tlp tlp-rdw
# sudo tlp start
sudo apt-fast install indicator-cpufreq

printf "\n[INSTALL UTILS]\n\n\n"
sudo apt-fast install preload dconf-editor virtualbox ubuntu-make wget

printf "\n[INSTALL GNOME SOFTWARE CENTER]\n\n\n"
sudo apt remove software-center
sudo apt autoremove software-center
sudo apt-fast install gnome-software

printf "\n[INSTALL NVIDIA DRIVERS]\n\n\n"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-fast update
sudo apt-fast install nvidia-384 nvidia-settings
sudo nvidia-xconfig

printf "\n[INSTALL TOUCHPAD GESTURES]\n\n\n"
sudo apt-fast install libinput-tools xdotool
sudo git clone git://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo make install
sudo gpasswd -a $USER input
libinput-gestures-setup autostart
cp -b ./libinput-gestures.conf /etc/
libinput-gestures-setup restart
sudo rm -rf libinput-gestures

printf "\n[INSTALL TOUCHPAD TOUCHPAD CALIBRATION]\n\n\n"
cp -b ./touchpad_settings.sh ~/.config/
chmod +x ~/.config/touchpad_settings.sh
gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/.config/touchpad_settings.sh"

printf "\n[INSTALL PLANK]\n\n\n"
sudo apt-add-repository ppa:docky-core/stable
sudo apt-fast update
sudo apt-fast install plank

printf "\n[INSTALL DARK THEME & TWEAK TOOL]\n\n\n"
sudo apt-fast install unity-tweak-tool
sudo add-apt-repository ppa:noobslab/themes
sudo apt-fast update
sudo apt-fast install arc-theme

printf "\n[INSTALL GOOGLE CHROME]\n\n\n"
sudo apt-fast install libxss1 libappindicator1 libindicator7
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-fast update 
sudo apt-fast install google-chrome-stable 
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb

printf "\n[INSTALL ANDROID STUDIO]\n\n\n"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-fast update
sudo apt-fast install oracle-java8-installer oracle-java8-set-default
sudo apt-fast install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
# wget https://dl.google.com/dl/android/studio/ide-zips/3.3.0.20/android-studio-ide-182.5199772-linux.zip
# sudo unzip android-studio-ide-182.5199772-linux.zip -d /opt
sudo umake android --accept-license
# sudo ./opt/android-studio/bin/studio.sh #launch

printf "\n[INSTALL INTELLIJ IDEA COMMUNITY EDITION]\n\n\n"
sudo umake ide idea --accept-license

printf "\n[INSTALL VISUAL STUDIO CODE]\n\n\n"
sudo apt-fast install software-properties-common apt-transport-https
# sudo apt-fast update
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt-fast install code
sudo umake web visual-studio-code --accept-license

# printf "\n[IMPORT DCONF SETTINGS...]\n\n\n"
# sudo cat dconf-settings.ini > dconf load /

echo "ADD TO AUTO LAUNCH:"
echo "/usr/bin/libinput-gestures"
echo "plank"
echo "indicator-cpufreq"
# echo "tlp"
echo "preload"
