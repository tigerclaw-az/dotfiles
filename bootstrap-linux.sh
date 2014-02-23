#!/usr/bin/env bash
cwd=pwd

if [ $(whoami) != "root" ]; then
	echo "ERROR: This script must be run as root!"
	exit 1
fi

###############################################################################
# Standard Linux packages                                                     #
###############################################################################
apt-get update
apt-get install -y aptitude chromium-browser dos2unix fluxgui git git-core bash-completion nodejs php5 python ruby

###############################################################################
# Macbuntu Theme                                                              #
###############################################################################
read -p "Do you want to install the Macbuntu theme? " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	wget https://downloads.sourceforge.net/project/macbuntu/macbuntu-10.10/v2.3/Macbuntu-10.10.tar.gz -O /tmp/Macbuntu-10.10.tar.gz
	tar xzvf /tmp/Macbuntu-10.10.tar.gz -C /tmp
	cd /tmp/Macbuntu-10.10/
	./install.sh
	cd $pwd
fi

cp home/.bash_profile ~/.profile
cp home/.functions ~
cp home/.inputrc ~
cp home/.gitconfig ~

source ~/.profile
