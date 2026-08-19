#p!/usr/bin/env bash
set -euo pipefail

export CI=1
export NONINTERACTIVE=1
export HOMEBREW_NO_AUTO_UPDATE=1

# pre-authenticate sudo
sudo -v

# ==============================================================================
# VIA APT
# * build-essential
# * procps
# * curl
# * file
# * git
# * unzip
# * postgresql
# ==============================================================================

sudo apt update
sudo apt install -y build-essential procps curl file git unzip postgresql

# ==============================================================================
# VIA CURL
# * homebrew
# * kitty
# * startship
# * google-chrome
# * d2coding nerd font
# ==============================================================================

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

sudo ln -sf "$HOME/.local/kitty.app/bin/kitty" "/usr/local/bin/kitty"
sudo ln -sf "$HOME/.local/kitty.app/bin/kitten" "/usr/local/bin/kitten"

mkdir -p "$HOME/.local/share/applications"
cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications/"
cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications/"

sed -i "s/^Icon=.*/Icon=org.gnome.Terminal/" "$HOME/.local/share/applications/kitty.desktop"
sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" "$HOME/.local/share/applications/kitty.desktop"

update-desktop-database "$HOME/.local/share/applications"

# install startship
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> "$HOME/.bashrc"

# install google-chrome
curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install -y "./google-chrome-stable_current_amd64.deb"
rm "./google-chrome-stable_current_amd64.deb"

# install d2coding nerd font
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/D2Coding.zip

mkdir -p "$HOME/.local/share/fonts"
unzip -o "./D2Coding.zip" -d "$HOME/.local/share/fonts/"
rm "./D2Coding.zip"

fc-cache -fv

# ==============================================================================
# VIA BREW
# IDE
# * pgcli
# * neovim
# LANG
# * go
# LSP
# * lua-language-server
# * pyright
# * gopls
# FORMATTER
# * ruff
# * stylua
# PACKAGE MANAGER
# * uv
# UTIL
# * htop
# * tree
# * ripgrep
# * tree-sitter-cli
# ==============================================================================

brew install pgcli neovim go lua-language-server pyright gopls ruff stylua uv htop tree ripgrep tree-sitter-cli

# ==============================================================================
# USER CONFIG
# ==============================================================================

git config --global user.name "dongyomi"
git config --global user.email "dhti375322@naver.com"
git config --global credential.helper store

mkdir -p "$HOME/.config/kitty"
mkdir -p "$HOME/.config/pgcli"

CONFIG_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd)/config

cp "${CONFIG_DIR}/pgcli" "${CONFIG_DIR}/pgcli.local"

ln -sfn "${CONFIG_DIR}/bash/bash_aliases" "$HOME/.bash_aliases"
ln -sfn "${CONFIG_DIR}/nvim" "$HOME/.config/nvim"
ln -sfn "${CONFIG_DIR}/kitty" "$HOME/.config/kitty/kitty.conf"
ln -sfn "${CONFIG_DIR}/pgcli.local" "$HOME/.config/pgcli/config"
ln -sfn "${CONFIG_DIR}/starship" "$HOME/.config/starship.toml"

mkdir -p "$HOME/projects"

# ==============================================================================
# COMPLETE & LAUNCH
# ==============================================================================

kitty --start-as maximized
