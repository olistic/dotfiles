# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Zsh history file, rather than overwriting it.
setopt append_history;
# Share history across all sessions.
setopt share_history;
# Remove older duplicate entries from history.
setopt hist_ignore_all_dups;
# Omit commands that begin with a space from history.
setopt hist_ignore_space;

# Enable some Zsh features:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`.
# * Recursive globbing, e.g. `echo **/*.txt`.
for option in autocd extendedglob; do
  setopt $option 2> /dev/null;
done;

# Make Homebrew installation available.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize the completion system.
autoload -Uz compinit; compinit

# Case-insensitive completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Initialize the prompt system.
autoload -U promptinit; promptinit

# Use pure prompt.
prompt pure

# Zsh plugins.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Node.js.

# nvm (lazy-loaded for faster shell startup).
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm node npm npx pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() { unset -f node; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; node "$@"; }
npm() { unset -f npm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npm "$@"; }
npx() { unset -f npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npx "$@"; }
pnpm() { unset -f pnpm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; pnpm "$@"; }

# Rust.

. "$HOME/.cargo/env"

# Java.
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

