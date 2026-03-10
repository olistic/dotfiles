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
  /bin/bash -c "$(curl -fsSL https://raw.github.com/Homebrew/install/HEAD/install.sh)"
fi

# Make Homebrew installation available.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install from Brewfile.
brew bundle --no-lock

# Remove outdated versions from the cellar.
brew cleanup

###############################################################################
# Node.js (via mise)                                                          #
###############################################################################

# Install and use latest release of Node.js.
mise use --global node@latest

# Enable corepack.
corepack enable

# Install TypeScript language server.
npm install -g typescript-language-server typescript

###############################################################################
# Python (via mise)                                                           #
###############################################################################

# Install and use latest release of Python.
mise use --global python@latest

# Install Python language server.
uv tool install pyright

# Install other tools.
uv tool install it2

###############################################################################
# Rust (via mise)                                                             #
###############################################################################

# Install and use latest release of Rust.
mise use --global rust@latest

# Install Rust language server.
cargo install rust-analyzer

###############################################################################
# Java (via mise)                                                             #
###############################################################################

# Install and use latest release of Java.
mise use --global java@zulu-17

###############################################################################
# Foundry (via mise)                                                          #
###############################################################################

# Install and use latest release of Foundry.
mise use --global foundry@latest

###############################################################################
# Dotfiles                                                                    #
###############################################################################

# Install dotfiles.
./bootstrap.sh -f
