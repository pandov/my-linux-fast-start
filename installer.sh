#!/bin/sh
sudo apt update
sudo apt upgrade

echo "\n\n[INSTALL APT-FAST]\n\n"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt update
sudo apt -y --force-yes install apt-fast

echo "\n\n[INSTALL GNOME SOFTWARE CENTER]\n\n"
sudo apt remove software-center
sudo apt autoremove software-center
sudo apt-fast -y --force-yes install gnome-software

echo "\n\n[INSTALL NVIDIA DRIVERS]\n\n"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-fast update
sudo apt-fast -y --force-yes install nvidia-384 nvidia-settings
sudo nvidia-xconfig

echo "\n\n[INSTALL TOUCHPAD GESTURES]\n\n"
sudo apt-fast -y --force-yes install libinput-tools xdotool
sudo git clone http://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo make -y --force-yes install
sudo gpasswd -a $USER input
libinput-gestures-setup autostart
cp -b ./libinput-gestures.conf /etc/
libinput-gestures-setup restart

echo "\n\n[INSTALL TOUCHPAD TOUCHPAD CALIBRATION]\n\n"
cp -b ./touchpad_settings.sh ~/
chmod +x ~/touchpad_settings.sh
gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/touchpad_settings.sh"

echo "\n\n[INSTALL PLANK]\n\n"
sudo apt-add-repository ppa:docky-core/stable
sudo apt-fast update
sudo apt-fast -y --force-yes install plank

echo "\n\n[INSTALL DARK THEME & TWEAK TOOL]\n\n"
sudo apt-fast install unity-tweak-tool
sudo add-apt-repository ppa:noobslab/themes
sudo apt-fast update
sudo apt-fast -y --force-yes install arc-theme

echo "\n\n[INSTALL UTILS]\n\n"
sudo apt-fast -y --force-yes install preload indicator-cpufreq dconf-editor virtualbox ubuntu-make wget

echo "\n\n[INSTALL GOOGLE CHROME]\n\n"
sudo apt-fast install libxss1 libappindicator1 libindicator7
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get -y --force-yes install google-chrome-stable 
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt -y install ./google-chrome-stable_current_amd64.deb

echo "\n\n[INSTALL ANDROID STUDIO]\n\n"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-fast update
sudo apt-fast -y --force-yes --force-yes install oracle-java8-installer oracle-java8-set-default
sudo apt-fast -y --force-yes install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
#wget https://dl.google.com/dl/android/studio/ide-zips/3.3.0.20/android-studio-ide-182.5199772-linux.zip
#sudo unzip android-studio-ide-182.5199772-linux.zip -d /opt
sudo umake android --accept-license
#sudo ./opt/android-studio/bin/studio.sh #launch

echo "\n\n[INSTALL INTELLIJ IDEA COMMUNITY EDITION]\n\n"
sudo umake ide idea --accept-license

echo "\n\n[INSTALL VISUAL STUDIO CODE]\n\n"
sudo apt-fast -y --force-yes install software-properties-common apt-transport-https
#sudo apt-fast update
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt-fast install code
sudo umake web visual-studio-code --accept-license
