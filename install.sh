#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install native apps and command-line tools using Homebrew and Cask.         #
###############################################################################

# Install Homebrew if not installed.
if ! which brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi;

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install from Brewfile.
brew bundle

# Remove outdated versions from the cellar.
brew cleanup

###############################################################################
# Node.js                                                                     #
###############################################################################

# Install nvm if not installed or upgrade it.
NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  (
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  )
else
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  )
fi

###############################################################################
# Python                                                                      #
###############################################################################

# Install virtualenv if not installed.
if ! which virtualenv > /dev/null; then
  pip install virtualenv
fi

###############################################################################
# Shell                                                                       #
###############################################################################

# Switch to using brew-installed zsh as default shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi

# Install Oh My Zsh if not installed.
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
else
  env ZSH="$ZSH" sh "$ZSH/tools/upgrade.sh"
fi

# Install pure prompt if not installed.
PURE_DIR="$HOME/.pure"
if [ ! -d "$PURE_DIR" ]; then
  git clone https://github.com/sindresorhus/pure.git "$PURE_DIR"
  (
    cd "$PURE_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  )
  ln -s "$PURE_DIR/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
  ln -s "$PURE_DIR/async.zsh" /usr/local/share/zsh/site-functions/async
else
  (
    cd "$PURE_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  )
fi

# Install dotfiles.
./bootstrap.sh -f
