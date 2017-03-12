#!/usr/bin/env bash

# Install command-line tools and applications using Homebrew and Cask.

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

# Install Oh My Zsh.

# Switch to using brew-installed zsh as default shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

# Install Oh My Zsh if not installed.
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
fi;
