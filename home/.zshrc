#!/bin/bash
#
# ---------------------------------------------------------------------------
#
# Description: This file holds all my shell configurations
#
# Sections:
# 1. Oh My Zsh Config
# 2. User Environment Configuration
# 3. Activate Additional Files
# ---------------------------------------------------------------------------

# -------------------------------
# 1. OH MY ZSH CONFIG
# -------------------------------
# Install: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wp-cli)

source $ZSH/oh-my-zsh.sh

# -------------------------------
# 2. USER ENVIRONMENT CONFIGURATION
# -------------------------------

#	Brew prefix (if applicable)
# ------------------------------------------------------------
prefix="/opt/homebrew/opt"
coreutils="${prefix}/coreutils"

if [[ "$prefix" != "" ]]; then
  export BYOBU_PREFIX=$prefix
fi

#	Setup path variables
# ------------------------------------------------------------

export GDK_PIXBUF_MODULEDIR="/usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders"
export GIT_PATH="${prefix}/git/bin"
export GIT_CORE_PATH="$GIT_PATH/../libexec/git-core"
export GIT_MERGE_AUTOEDIT="false"
export CURL_HOME="${prefix}/curl"
export CURLOPENSSL_HOME="${prefix}/curl-openssl"
export COMPOSER_BIN="${HOME}/.composer/vendor/bin"
export PATH="$HOME/bin:${HOME}/.pyenv/shims:/opt/homebrew/bin:/opt/homebrew/sbin:${coreutils}/bin:${CURLOPENSSL_HOME}/bin:${CURL_HOME}/bin:${COMPOSER_BIN}:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export GPG_TTY=$(tty)

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#	Homebrew Casks installation folder
# ------------------------------------------------------------
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export MANPATH=$coreutils/libexec/gnubin:$MANPATH

# Set Default Editor
# ------------------------------------------------------------
export EDITOR='code --wait'

# Set terminal colors
# ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# -------------------------------
# 3. ACTIVATE ADDITIONAL FILES
# -------------------------------
source $HOME/.aliases
source $HOME/.aliases.OSX
source $HOME/.functions

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
	source $(brew --prefix nvm)/nvm.sh
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
