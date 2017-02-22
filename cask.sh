#!/usr/bin/env bash

# Install native apps using Cask.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install apps.
brew cask install atom
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install hyper
brew cask install java
brew cask install xquartz
