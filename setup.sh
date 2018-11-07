#!/bin/sh

# Arch system installer
echo ---------------------------------------------
echo Shell script setup installer for Arch systems
echo ---------------------------------------------

# Update packages
sudo pacman -Syu --noconfirm \

# Install AUR package manager
yay \

# Install zsh
zsh \

# Install zplug
zplug \

# Install neovim
neovim \

# Install tilix
tilix \

# Install xclip for neovim clipboard
xclip

# Install more applications here

# Default to zsh
chsh -s $(which zsh)

# Install python modules for neovim
pip3 install neovim --user

# Install tilix color scheme;
if [[ ! -f ~/.config/tilix/schemes/base16-atelier-plateau.json ]]; then
    mkdir -p ~/.config/tilix/schemes
    wget https://raw.githubusercontent.com/karlding/base16-tilix/master/tilix/base16-atelier-plateau.json -O ~/.config/tilix/schemes/base16-atelier-plateau.json
fi

# Update AUR
yay -Syu --noconfirm \

# Install fonts and glyphs
nerd-fonts-complete-mono-glyphs \

# Install vim-plug
neovim-plug

# Copy files to corresponding directories
cp ./zsh/zshrc ~/.zshrc
mkdir -p ~/.config/nvim
cp ./neovim/init.vim ~/.config/nvim/init.vim
dconf load /com/gexperts/Tilix/ < ./tilix/tilix.dconf

# Install plugins
zsh                     # switch to zsh
zplug install
nvim +'PlugInstall --sync' +qa;

### Hotkeys
# Ctrl+Alt+{h,j,k,l,u} - tile windows
# Ctrl+Alt+T           - terminal
###

echo ---------------------------------------------
echo Shell script setup installer completed
echo ---------------------------------------------

