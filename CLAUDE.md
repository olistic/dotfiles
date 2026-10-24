## Commands

- `./bootstrap.sh` — symlink dotfiles to `~` (prompts for confirmation; use `-f` to skip)
- `./install.sh` — install Homebrew, Brewfile, runtimes (Node.js, Bun, pnpm, Python, Rust, Java, Foundry via mise), then runs bootstrap
- `./macos.sh` — apply macOS user defaults (no sudo required)

## Architecture

- Dotfiles are **symlinked** from this repo to `~` via `bootstrap.sh`
- Directories with runtime state (`.ssh`) are NOT symlinked wholesale — only individual config files inside them are
- Machine-specific config goes in untracked local files, not in the repo

## Key files

- `.zshrc` — shell config, sources `.path`, `.exports`, `.aliases`, `.extra`
- `.extra` — machine-specific env vars and secrets (not tracked)
- `.gitconfig` — shared git config, uses `[include]` for `~/.gitconfig.local`
- `.gitconfig.local` — machine-specific git identity and signing key (not tracked)
- `.duti` — default app associations (applied by `install.sh` via `duti`)
- `.config/starship.toml` — prompt theme
- `bootstrap.sh` — symlinks dotfiles to `~`
- `install.sh` — installs Homebrew, Brewfile, runtimes via mise
- `Brewfile` — Homebrew packages and casks
- `macos.sh` — macOS defaults
- `.githooks/pre-commit` — gitleaks secret scan, shared by every repo via `core.hooksPath`
- `.github/workflows/lint.yml` — shellcheck, zsh parse-check, JSON validation, secret scan

## Gotchas

- `install.sh` is bash; `bootstrap.sh` is zsh — don't mix syntax assumptions
- `.duti` application silently no-ops if `duti` isn't installed yet (it's in the Brewfile, so it works on full `install.sh` runs)
- `core.hooksPath` is global, so `.githooks/pre-commit` runs in **every** repo. Repos that set their own `core.hooksPath` (husky) override it, but repos relying on `.git/hooks/` will not run those hooks
- The pre-commit hook no-ops with a warning when `gitleaks` is missing, so a machine without it silently loses secret scanning

## Conventions

- Shell functions and variables use `snake_case`
- Zsh `setopt` options use `snake_case` (e.g. `append_history`)
- Git config keys use canonical camelCase (e.g. `autoSquash`, `autoStash`)
