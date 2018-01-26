#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $(whoami) != "root" ]; then
	echo "ERROR: This script must be run as root!"
	exit 1
fi

###############################################################################
# Install Linux packages                                                     #
###############################################################################
read -p "Do you want to perform install/upgrade?[yN] " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sh bin/.repositories
	sh bin/.packages
fi

###############################################################################
# Macbuntu Theme                                                              #
###############################################################################
read -p "Do you want to install the Macbuntu theme [yN]? " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Installing dependencies..."
	apt-get install gnome-shell gnome-tweak-tool
	if [ $? != 0 ]; then
		echo -e "\033[31mFAILED\033[0m"
		echo "Run 'sudo apt-get install gnome-shell gnome-tweak-tool gtk2-engines-pixbuf'"
	else
		add-apt-repository ppa:noobslab/macbuntu
		apt-get update
		apt-get install macbuntu-os-icons-v10 macbuntu-os-ithemes-v10 macbuntu-os-plank-theme-v9
		echo "Performing Macbuntu install..."
		# ./install.sh
		if [ $? != 0 ]; then
			echo -e "\033[31mFAILED\033[0m"
			echo "Run 'sudo apt-get install macbuntu-os-icons-v10 macbuntu-os-ithemes-v10 macbuntu-os-plank-theme-v9'"
		else
			echo -e "\033[32mSUCCEEDED\033[0m"
			echo "Changing window button layout..."
			gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

			echo "Extract OSX theme..."
			mkdir ~/.themes
			tar -xvf bin/Gnome-OSX-V-HSierra-1-3-3.tar.xz -C ~/.themes
		fi
	fi

	cd $pwd
fi

if [ -f ~/.bash-git-prompt ]; then
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

echo -e "Linking home files..."
ln -s "$DIR/home/.bash_profile.LINUX" ~/.bashrc
ln -s "$DIR/home/.aliases.LINUX" ~/.aliases.LINUX
ln -s "$DIR/home/.functions" ~/.functions
ln -s "$DIR/home/.inputrc" ~/.inputrc
ln -s "$DIR/home/.gitconfig" ~/.gitconfig
ln -s "$DIR/home/.gitprompt" ~/.gitprompt

source ~/.bashrc

echo -e "----"
echo -e "Disable update manager: http://ubuntuforums.org/showthread.php?t=1966228\n"
