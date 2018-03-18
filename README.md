# Olistic’s dotfiles

## Installation

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.)

```bash
$ git clone https://github.com/olistic/dotfiles.git
```

### Homebrew formulae and Oh My Zsh!

When setting up a new Mac, you may want to start by installing some common [Homebrew](https://brew.sh/) formulae and [Cask](https://brew.sh/) native apps.

The installation script will install Homebrew with everything inside of `Brewfile`, as well as Oh My Zsh!

```bash
$ ./install.sh
```

### Dotfiles

The bootstrapper script will pull in the latest version and copy the dotfiles to your home folder.

```bash
$ source bootstrap.sh
```

### Add custom commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Matias Olivera"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="moliverafreire@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/olistic/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may also want to set some sensible macOS defaults:

```bash
$ ./macos.sh
```

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his original [dotfiles repository](https://github.com/mathiasbynens/dotfiles).
