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

# Initialize the prompt.
eval "$(starship init zsh)"

# Zsh plugins.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate mise (manages Node.js, Python, Rust, Java, etc.).
eval "$(mise activate zsh)"

# Initialize zoxide (smarter cd).
eval "$(zoxide init zsh)"
