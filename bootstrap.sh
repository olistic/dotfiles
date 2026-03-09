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
  .nvmrc
  .path
  .vim
  .vimrc
  .wgetrc
  .zshrc
)

# Files to symlink inside directories that hold runtime state (keys, caches).
# These directories must not be symlinked wholesale.
DIR_SYMLINKS=(
  .claude/CLAUDE.md
  .claude/settings.json
  .gnupg/gpg-agent.conf
  .ssh/config
)

symlink() {
  local target="$1" link="$2"

  if [[ -L "$link" && "$(readlink "$link")" == "$target" ]]; then
    return
  fi

  [[ -e "$link" || -L "$link" ]] && rm -rf "$link"
  ln -sv "$target" "$link"
}

do_it() {
  for item in "${SYMLINKS[@]}"; do
    symlink "$DOTFILES_DIR/$item" "$HOME/$item"
  done

  for item in "${DIR_SYMLINKS[@]}"; do
    mkdir -p "$HOME/$(dirname "$item")"
    symlink "$DOTFILES_DIR/$item" "$HOME/$item"
  done

  source ~/.zshrc
}

if [[ "$1" == "-f" ]]; then
  do_it
else
  echo -n "This will replace dotfiles in your home directory with symlinks. Are you sure? (y/n) "
  read -k 1 overwrite
  if [[ "$overwrite" =~ ^[Yy]$ ]]; then
    echo ""
    do_it
  fi
fi
unset do_it
