# UBUNTU SETUP
	fat32	/boot/efi		256
	ext4		/		16384
	swap				8192
	ext4		/home		...

# SETUP
	$ sudo apt install git
	$ git clone git://github.com/pandov/ubuntu-fast-install.git
	$ cd ubuntu-fast-install
	$ sudo ./installer.sh
