#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
	if [ -f ~/.osx ]; then
		mv ~/.osx ~/.osx.BAK
	fi
	ln -s "$DIR/home/.osx" ~/.osx
	source ~/.osx
fi

echo -e "Linking home files..."
ln -s "$DIR/home/.bash_profile.OSX" ~/.bashrc
ln -s ~/.bashrc ~/.profile
ln -s "$DIR/home/.aliases" ~/.aliases
ln -s "$DIR/home/.functions" ~/.functions
ln -s "$DIR/home/.inputrc" ~/.inputrc
ln -s "$DIR/home/.gitconfig" ~/.gitconfig
ln -s "$DIR/home/.gitprompt" ~/.gitprompt

source ~/.profile

echo -e "----"
echo -e "Download Sublime Text: http://www.sublimetext.com/3"
