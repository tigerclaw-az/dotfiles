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
# Sublime Text                                                                #
###############################################################################
read -p "Do you want to copy Sublime Text settings? " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cp -r dev/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
fi

###############################################################################
# OSX Defaults                                                                #
###############################################################################
read -p "Do you want to update OSX defaults? " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cp home/.osx ~
	source ~/.osx
fi

cp home/.bash_profile ~/.profile
cp home/.functions ~
cp home/.inputrc ~
cp home/.gitconfig ~

source ~/.profile
