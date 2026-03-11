# olistic's dotfiles

## Installation

Clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.)

```bash
git clone https://github.com/olistic/dotfiles.git
```

### Install

The installation script will install [Homebrew](https://brew.sh/) with everything in the `Brewfile`, and set up runtimes (Node.js, Python, Rust, Java, Foundry) via [mise](https://mise.jdx.dev).

```bash
./install.sh
```

### Bootstrap

The bootstrapper script will symlink the dotfiles to your home folder.

```bash
source bootstrap.sh
```

### Terminal font

Set your terminal font to **JetBrainsMono Nerd Font** for Starship prompt icons and ligatures. In iTerm2: Settings > Profiles > Text > Font.

### SSH key

Generate an Ed25519 SSH key and add it to GitHub for both authentication and commit signing:

```bash
ssh-keygen -t ed25519 -C "your@email.com"
gh ssh-key add ~/.ssh/id_ed25519.pub --title "my-mac (auth)" --type authentication
gh ssh-key add ~/.ssh/id_ed25519.pub --title "my-mac (signing)" --type signing
```

Create `~/.ssh/allowed_signers` for local signature verification:

```
your@email.com ssh-ed25519 AAAA...
```

### Local git config

The shared `.gitconfig` uses `[include]` to pull in `~/.gitconfig.local` for user identity and other machine-specific settings. Create this file on each machine:

```gitconfig
[user]
	name = Your Name
	email = your@email.com
	signingkey = ~/.ssh/id_ed25519.pub
```

### Custom commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add commands and environment variables you don't want to commit to a public repository.

### macOS defaults

When setting up a new Mac, you may also want to set some sensible macOS defaults:

```bash
./macos.sh
```

### CTF tools

CTF tools are in a separate `Brewfile.ctf` and can be installed on-demand:

```bash
brew bundle --no-lock --file=Brewfile.ctf
```

## Thanks to...

- [Mathias Bynens](https://mathiasbynens.be) and his original [dotfiles repository](https://github.com/mathiasbynens/dotfiles).
