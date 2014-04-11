#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################
which -s brew
if [[ $? != 0 ]]; then
	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
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

echo -e "Linking home files..."
ln -s home/.bash_profile ~/.profile
ln -s home/.functions ~/.functions
ln -s home/.inputrc ~/.inputrc
ln -s home/.gitconfig ~/.gitconfig
ln -s home/.gitprompt ~/.gitprompt

source ~/.profile

echo -e "----"
echo -e "Download Sublime Text: http://www.sublimetext.com/3"
