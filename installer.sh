#!/bin/sh

echo "\n[INSTALL APT-FAST]\n"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt update
sudo apt install apt-fast

echo "\n[INSTALL GNOME SOFTWARE CENTER]\n"
sudo apt remove software-center
sudo apt autoremove software-center
sudo apt-fast install gnome-software

echo "\n[INSTALL NVIDIA DRIVERS]\n"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-fast update
sudo apt-fast install nvidia-384 nvidia-settings
sudo nvidia-xconfig

echo "\n[INSTALL TOUCHPAD GESTURES]\n"
sudo apt-fast install libinput-tools xdotool
sudo git clone http://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo make install
sudo gpasswd -a $USER input
libinput-gestures-setup autostart
cp -b ./libinput-gestures.conf /etc/
libinput-gestures-setup restart

echo "\n[INSTALL TOUCHPAD TOUCHPAD CALIBRATION]\n"
cp -b ./touchpad_settings.sh ~/
chmod +x ~/touchpad_settings.sh
gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/$USER/touchpad_settings.sh"

echo "\n[INSTALL PLANK]\n"
sudo apt-add-repository ppa:docky-core/stable
sudo apt-fast update
sudo apt-fast install plank

echo "\n[INSTALL DARK THEME & TWEAK TOOL]\n"
sudo apt-fast install unity-tweak-tool
sudo add-apt-repository ppa:noobslab/themes
sudo apt-fast update
sudo apt-fast install arc-theme

echo "\n[INSTALL UTILS...]"
sudo apt-fast install preload indicator-cpufreq dconf-editor virtualbox ubuntu-make wget

echo "\n[INSTALL GOOGLE CHROME]"
sudo apt-fast install libxss1 libappindicator1 libindicator7
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable 
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb

echo "\n[INSTALL ANDROID STUDIO]"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-fast update
sudo apt-fast install oracle-java8-installer oracle-java8-set-default
sudo apt-fast install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
#wget https://dl.google.com/dl/android/studio/ide-zips/3.3.0.20/android-studio-ide-182.5199772-linux.zip
#sudo unzip android-studio-ide-182.5199772-linux.zip -d /opt
sudo umake android --accept-license
sudo ./opt/android-studio/bin/studio.sh

echo "\n[INSTALL INTELLIJ IDEA COMMUNITY EDITION]"
sudo umake ide idea

echo "\n[INSTALL VISUAL STUDIO CODE]"
sudo apt-fast install software-properties-common apt-transport-https
#sudo apt-fast update
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt-fast install code
sudo umake web visual-studio-code
