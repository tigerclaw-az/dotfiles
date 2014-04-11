#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################
which -s brew
if [[ $? != 0 ]]; then
	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	sh bin/.brew
fi

###############################################################################
# OSX Defaults                                                                #
###############################################################################
read -p "Do you want to update OSX defaults? " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	ln -s home/.osx ~/.osx
	source ~/.osx
fi

ln -s home/.bash_profile ~/.profile
ln -s home/.functions ~/.functions
ln -s home/.inputrc ~/.inputrc
ln -s home/.gitconfig ~/.gitconfig

source ~/.profile

echo -e "Download Sublime Text: http://www.sublimetext.com/3"
