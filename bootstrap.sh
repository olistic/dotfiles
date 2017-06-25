#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

doIt() {
  rsync \
    --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "Brewfile" \
    --exclude "bootstrap.sh" \
    --exclude "install.sh" \
    --exclude "macos.sh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;

  source ~/.zshrc;
}

if [[ "$1" == "-f" ]]; then
  doIt;
else
  echo -n "This may overwrite existing files in your home directory. Are you sure? (y/n) ";
  read -k 1 overwrite;
  if [[ "$overwrite" =~ ^[Yy]$ ]]; then
    echo "";
    doIt;
  fi;
fi;
unset doIt;
