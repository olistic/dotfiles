## Architecture

- Dotfiles are **symlinked** from this repo to `~` via `bootstrap.sh`
- Directories with runtime state (`.gnupg`, `.ssh`) are NOT symlinked wholesale — only individual config files inside them are
- Machine-specific config goes in untracked local files, not in the repo

## Key files

- `.zshrc` — shell config, sources `.path`, `.exports`, `.aliases`, `.extra`
- `.extra` — machine-specific env vars and secrets (not tracked)
- `.gitconfig` — shared git config, uses `[include]` for `~/.gitconfig.local`
- `.gitconfig.local` — machine-specific git identity and signing key (not tracked)
- `bootstrap.sh` — symlinks dotfiles to `~`
- `install.sh` — installs Homebrew, Brewfile, runtimes via mise
- `macos.sh` — macOS defaults

## Conventions

- Shell functions and variables use `snake_case`
- Zsh `setopt` options use `snake_case` (e.g. `append_history`)
- Git config keys use canonical camelCase (e.g. `autoSquash`, `autoStash`)
