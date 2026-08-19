# Dotfiles

A personal dotfiles repository for managing my development environment, tools, and configurations.

> [!WARNING]
> This project has been tested on **Ubuntu Desktop** only.

## Components

### Packages

List of packages to install.

* apt
  * build-essential
  * procps
  * curl
  * file
  * git
  * unzip
  * postgresql

+ curl
  + homebrew
  + kitty
  + starship
  + google-chrome
  + d2coding nerd font

- brew
  - pgcli
  - neovim
  - go
  - lua-language-server
  - pyright
  - gopls
  - ruff
  - stylua
  - uv
  - htop
  - tree
  - ripgrep
  - tree-sitter-cli

### Configs

List of configurations to symlink.

* bash
* kitty
* nvim
* pgcli
* starship

## Setup

### Automated Setup

```
chmod +x setup.sh && ./setup.sh
```

### Manual Setup

1. telescope.nvim

   Build the dependency plugin to enable fast fuzzy finding.

```
make -C ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim/
```

2. markdown-preview.nvim

    Run the following command in nvim to complete the plugin installation.

```
:call mkdp#util#install()
```

3. pgcli.local

    Add your database connection details to the local config.

```
[alias_dsn]
# example_dsn = postgresql://[user[:password]@][netloc][:port][/dbname]
```

## Others

### Guide

* git-convention

### Theme

* gruvbox-material-dark-hard
