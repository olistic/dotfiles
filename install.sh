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

# Install nvm if not installed.
if [ ! -d ~/.nvm ]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
  (cd ~/.nvm && git checkout v0.33.6)
fi

###############################################################################
# Python                                                                      #
###############################################################################

# Install virtualenv.
pip install virtualenv

###############################################################################
# Shell                                                                       #
###############################################################################

# Switch to using brew-installed zsh as default shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

# Install Oh My Zsh if not installed.
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
fi;

# Install pure prompt if not installed.
if [ ! -d ~/.pure ]; then
  git clone https://github.com/sindresorhus/pure.git ~/.pure
  ln -s ~/.pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
  ln -s ~/.pure/async.zsh /usr/local/share/zsh/site-functions/async
fi

# Install dotfiles.
./bootstrap.sh -f
