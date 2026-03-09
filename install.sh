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
# Node.js                                                                     #
###############################################################################

# Install nvm if not installed or upgrade it.
NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  (
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  )
else
  (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  )
fi

# Load nvm.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install and use latest release of Node.js.
nvm install node && nvm use node

# Enable corepack.
corepack enable

# Install TypeScript language server.
npm install -g typescript-language-server typescript

###############################################################################
# Rust                                                                        #
###############################################################################

# Use rustup to install the Rust compiler (rustc) and the Rust package manager (cargo).
rustup-init -y --no-modify-path

###############################################################################
# Python tools                                                                #
###############################################################################

# Install uv if not installed.
if ! which uv > /dev/null; then
  curl -LsSf https://astral.sh/uv/install.sh | UV_NO_MODIFY_PATH=1 sh
fi

# Install Python language server.
uv tool install pyright

# Install other tools.
uv tool install it2

###############################################################################
# Dotfiles                                                                    #
###############################################################################

# Install dotfiles.
./bootstrap.sh -f
