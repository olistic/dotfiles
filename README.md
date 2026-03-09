# Olistic's dotfiles

## Installation

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.)

```bash
git clone https://github.com/olistic/dotfiles.git
```

### Homebrew formulae

When setting up a new Mac, you may want to start by installing some common [Homebrew](https://brew.sh/) formulae, casks, and VS Code extensions.

The installation script will install Homebrew with everything inside of `Brewfile`, set up Node.js (via nvm), and install Rust (via rustup).

```bash
./install.sh
```

### Dotfiles

The bootstrapper script will symlink the dotfiles to your home folder.

```bash
source bootstrap.sh
```

### Local git config

The shared `.gitconfig` uses `[include]` to pull in `~/.gitconfig.local` for user identity and other machine-specific settings. Create this file on each machine:

```gitconfig
[user]
	name = Your Name
	email = your@email.com
	signingkey = YOUR_GPG_KEY_ID
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/olistic/dotfiles/blob/9b71a58e23f8732dcd3ceb31ea4464696d599eeb/.aliases#L19-L26)) takes place.

Here's an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add commands and environment variables you don't want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It's probably better to [fork this repository](https://github.com/olistic/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may also want to set some sensible macOS defaults:

```bash
./macos.sh
```

## Thanks to…

- [Mathias Bynens](https://mathiasbynens.be/) and his original [dotfiles repository](https://github.com/mathiasbynens/dotfiles).
