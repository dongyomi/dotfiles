#!/bin/bash

echo "Enter password"
sudo -v

mkdir -p ~/.config ~/.local/share/fonts ~/projects
rm -rf ~/.config/kitty ~/.config/nvim

sudo apt update
sudo apt install -y kitty curl xclip fd-find ripgrep python3.12-venv postgresql tree lua5.1 r-base libpq-dev libcurl4-openssl-dev libgit2-dev libssl-dev libssh2-1-dev libxml2-dev libfontconfig1-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libharfbuzz-dev libfribidi-dev redis

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

sudo snap install dbeaver-ce --classic

ln -sf $HOME/dotfiles/kitty ~/.config/kitty 
ln -sf $HOME/dotfiles/nvim ~/.config/nvim
ln -sf $HOME/dotfiles/bash/bash_aliases ~/.bash_aliases
ln -sf $HOME/dotfiles/bash/bash_theme ~/.bash_theme

if [ -f "/usr/share/applications/kitty.desktop" ]; then
    sudo sed -i 's/^Icon=.*/Icon=org.gnome.Terminal/' /usr/share/applications/kitty.desktop
fi

if ! grep -q "bash_theme" ~/.bashrc; then
cat << 'EOF' >> ~/.bashrc

# Theme definitions.

if [ -f ~/.bash_theme ]; then
    . ~/.bash_theme
fi
EOF
fi

cp $HOME/dotfiles/fonts/D2CodingLigatureNerdFont-Regular.ttf ~/.local/share/fonts/
fc-cache -fv

echo "Setup complete"
