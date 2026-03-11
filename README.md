# olistic's dotfiles

## Installation

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.)

```bash
git clone https://github.com/olistic/dotfiles.git
```

### Homebrew formulae

When setting up a new Mac, you may want to start by installing some common [Homebrew](https://brew.sh/) formulae, casks, and VS Code extensions.

The installation script will install Homebrew with everything inside of `Brewfile`, and set up runtimes (Node.js, Python, Rust, Java) via [mise](https://mise.jdx.dev).

```bash
./install.sh
```

### Dotfiles

The bootstrapper script will symlink the dotfiles to your home folder.

```bash
source bootstrap.sh
```

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

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/olistic/dotfiles/blob/9b71a58e23f8732dcd3ceb31ea4464696d599eeb/.aliases#L19-L26)) takes place.

Here's an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add commands and environment variables you don't want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It's probably better to [fork this repository](https://github.com/olistic/dotfiles/fork) instead, though.

### Terminal font

Set your terminal font to **JetBrainsMono Nerd Font** for Starship prompt icons and ligatures. In iTerm2: Settings > Profiles > Text > Font.

### Sensible macOS defaults

When setting up a new Mac, you may also want to set some sensible macOS defaults:

```bash
./macos.sh
```

### CTF tools

CTF tools are in a separate `Brewfile.ctf` and can be installed on-demand:

```bash
brew bundle --no-lock --file=Brewfile.ctf
```

## Thanks to…

- [Mathias Bynens](https://mathiasbynens.be/) and his original [dotfiles repository](https://github.com/mathiasbynens/dotfiles).
