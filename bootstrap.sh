#!/usr/bin/env zsh

DOTFILES_DIR="$(cd "$(dirname "${0}")" && pwd)"

# Files and directories to symlink to ~.
SYMLINKS=(
  .aliases
  .curlrc
  .editorconfig
  .exports
  .gitconfig
  .gitignore
  .gnupg
  .nvmrc
  .path
  .ssh
  .vim
  .vimrc
  .wgetrc
  .zshrc
)

doIt() {
  for item in "${SYMLINKS[@]}"; do
    target="$DOTFILES_DIR/$item"
    link="$HOME/$item"

    # Remove existing file/directory (but not if it's already the correct symlink).
    if [[ -e "$link" || -L "$link" ]]; then
      if [[ -L "$link" && "$(readlink "$link")" == "$target" ]]; then
        continue
      fi
      rm -rf "$link"
    fi

    ln -sv "$target" "$link"
  done

  source ~/.zshrc
}

if [[ "$1" == "-f" ]]; then
  doIt
else
  echo -n "This will replace dotfiles in your home directory with symlinks. Are you sure? (y/n) "
  read -k 1 overwrite
  if [[ "$overwrite" =~ ^[Yy]$ ]]; then
    echo ""
    doIt
  fi
fi
unset doIt
