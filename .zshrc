# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Zsh history file, rather than overwriting it.
setopt appendhistory;

# Enable some Zsh features:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`.
# * Recursive globbing, e.g. `echo **/*.txt`.
for option in autocd extendedglob; do
  setopt $option 2> /dev/null;
done;

# Make Homebrew installation available.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize the prompt system.
autoload -U promptinit; promptinit

# Use pure prompt.
prompt pure

# Node.js.

# nvm.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Rust.

. "$HOME/.cargo/env"

# Java.
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
