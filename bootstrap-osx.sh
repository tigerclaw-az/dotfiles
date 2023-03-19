#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "Linking home files..."
ln -s "$DIR/home/.bash_profile.OSX" ~/.bash_profile
ln -s "$DIR/home/.aliases.OSX" ~/.aliases.OSX
ln -s ~/.bash_profile ~/.profile
ln -s ~/.bash_profile ~/.bashrc
ln -s "$DIR/home/.zshrc" ~/.zshrc
ln -s "$DIR/home/.aliases" ~/.aliases
ln -s "$DIR/home/.functions" ~/.functions
ln -s "$DIR/home/.inputrc" ~/.inputrc
ln -s "$DIR/home/.gitconfig" ~/.gitconfig
ln -s "$DIR/home/.gitprompt" ~/.gitprompt

source ~/.bash_profile

###############################################################################
# Homebrew                                                                    #
###############################################################################
which -s brew
if [[ $? != 0 ]]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

/opt/homebrew/bin/brew tap homebrew/bundle
cd bin/
/opt/homebrew/bin/brew bundle
cd ..

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

######
# Additional software/command tools
######

# Rust #
which -s rustup
if [[ $? != 0 ]]; then
	echo "Installing Rust..."
	curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
fi

# Oh My Zsh #
which -s zsh
if [[ $? != 0 ]]; then
	echo "Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#########
# npm
#########
read -p "Do you want to install npm packages?" -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
	which -s node
	if [[ $? != 0 ]]; then
		echo "Installing node..."
		nvm install 16
		nvm use 16
	fi
	cd bin/
	sh npm.sh
fi
