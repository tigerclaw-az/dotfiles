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
	sh bin/.packages
fi

###############################################################################
# Macbuntu Theme                                                              #
###############################################################################
read -p "Do you want to install the Macbuntu theme [yN]? " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	wget https://downloads.sourceforge.net/project/macbuntu/macbuntu-10.10/v2.3/Macbuntu-10.10.tar.gz -O /tmp/Macbuntu-10.10.tar.gz
	tar xzvf /tmp/Macbuntu-10.10.tar.gz -C /tmp > /dev/null 2>&1
	cd /tmp/Macbuntu-10.10/
	echo "Performing Macbuntu install..."
	./install.sh
	if [ $? != 0 ]; then
		echo -e "\033[31mFAILED\033[0m"
	else
		echo -e "\033[32mSUCCEEDED\033[0m"
	fi
	cd $pwd
fi

echo -e "Linking home files..."
ln -s "$DIR/home/.bash_profile.LINUX" ~/.bashrc
ln -s "$DIR/home/.functions" ~/.functions
ln -s "$DIR/home/.inputrc" ~/.inputrc
ln -s "$DIR/home/.gitconfig" ~/.gitconfig
ln -s "$DIR/home/.gitprompt" ~/.gitprompt

source ~/.bashrc

echo -e "----"
echo -e "Download Sublime Text: http://www.sublimetext.com/3"
echo -e "Disable update manager: http://ubuntuforums.org/showthread.php?t=1966228\n"
