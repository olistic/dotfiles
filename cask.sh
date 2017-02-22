#!/usr/bin/env bash

# Install native apps using Cask.

# Get Cask.
brew tap caskroom/cask
brew tap caskroom/versions

# Make sure we’re using the latest Homebrew.
brew update

# Install apps.
brew cask install atom
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install hyper
brew cask install java
brew cask install paw
brew cask install slack
brew cask install spotify
brew cask install xquartz
