#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "cask.sh" \
		--exclude "macos.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if read -q \?"This may overwrite existing files in your home directory. Are you sure? (y/n) "; then
	echo "";
	doIt;
fi;
unset doIt;
