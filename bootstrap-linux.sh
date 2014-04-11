#!/usr/bin/env bash
cwd=$(pwd)

if [ $(whoami) != "root" ]; then
	echo "ERROR: This script must be run as root!"
	exit 1
fi

###############################################################################
# Install Linux packages                                                     #
###############################################################################
packagesFile="packages-linux.txt"
echo -e "Performing apt-get update & upgrade..."
(apt-get update && apt-get upgrade) > /dev/null 2>&1
filecontent=( `cat $packagesFile `)
echo -e "\nThe following packages will be installed or upgraded:\n\t\033[33m${filecontent[@]}\033[0m\n"
read -p "Do you want to install packages?[yN] " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	for p in "${filecontent[@]}"
	do
		apt-get install -y $p
		if [ $? != 0 ]; then
			echo -e "\t\033[31mFAIL\033[0m"
		else
			echo -e "\t\033[32mSUCCESS\033[0m"
		fi
	done
	echo -e "--> Package installation completed!"
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
ln -s "$cwd/home/.bash_profile.LINUX" ~/.bashrc
ln -s "$cwd/home/.functions" ~/.functions
ln -s "$cwd/home/.inputrc" ~/.inputrc
ln -s "$cwd/home/.gitconfig" ~/.gitconfig
ln -s "$cwd/home/.gitprompt" ~/.gitprompt

source ~/.bashrc

echo -e "----"
echo -e "Download Sublime Text: http://www.sublimetext.com/3"
echo -e "Disable update manager: http://ubuntuforums.org/showthread.php?t=1966228\n"
