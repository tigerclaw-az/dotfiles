#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

###############################################################################
# Homebrew                                                                    #
###############################################################################
which -s brew
if [[ $? != 0 ]]; then
	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/bundle
	cd bin/
	brew bundle
	cd ..
fi

#########
# npm
#########
read -p "Do you want to install npm packages?" -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cd bin/
	sh npm.sh
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
ln -s "$DIR/home/.bash_profile.OSX" ~/.bash_profile
ln -s "$DIR/home/.aliases.OSX" ~/.aliases.OSX
ln -s ~/.bash_profile ~/.profile
ln -s ~/.bash_profile ~/.bashrc
ln -s "$DIR/home/.aliases" ~/.aliases
ln -s "$DIR/home/.functions" ~/.functions
ln -s "$DIR/home/.inputrc" ~/.inputrc
ln -s "$DIR/home/.gitconfig" ~/.gitconfig
ln -s "$DIR/home/.gitprompt" ~/.gitprompt

source ~/.bash_profile

