#!/bin/bash

echo "Enter password"
sudo -v

mkdir -p ~/.config ~/.local/share/fonts ~/projects
rm -rf ~/.config/kitty ~/.config/nvim

sudo apt update
sudo apt install -y kitty curl xclip fd-find ripgrep python3.12-venv 
sudo snap install nvim --classic
sudo apt install postgresql
sudo snap install dbeaver-ce --classic
sudo apt install tree

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
