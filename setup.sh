#!/bin/sh

# Arch system installer
echo ---------------------------------------------
echo Shell script setup installer for Arch systems
echo ---------------------------------------------

# Update packages
pacman -Syu --noconfirm

# Install AUR package manager
sudo pacman -Sy yay

# Install zsh
pacman -S zsh --noconfirm

# Install zplug
pacman -S zplug --noconfirm

# Install neovim
pacman -S neovim --noconfirm

# Install python modules for neovim
pip3 install neovim

# Install tilix
pacman -S tilix --noconfirm 

# Install xclip for neovim clipboard
pacman -S xclip --noconfirm

# Install tilix color scheme;
if [[ ! -f ~/.config/tilix/schemes/base16-atelier-forest.json ]]; then
    mkdir -p ~/.config/tilix/schemes
    wget https://raw.githubusercontent.com/karlding/base16-tilix/master/tilix/base16-atelier-forest.json -OP ~/.config/tilix/schemes
fi

# Install fonts and glyphs
# Make sure to change to Nerd font in Tilix
yay -Sy nerd-fonts-complete-mono-glyphs --noconfirm

# Copy files to corresponding directories
cp ./zsh/zshrc ~/.zshrc
cp ./neovim/init.vim ~/.config/nvim/init.vim
dconf load /com/gexperts/Tilix/ < tilix.dconf

# Install plugins
chsh -s $(which zsh) # switch to shells
zplug install
nvim +'PlugInstall --sync' +qa;

# Install more applications here

### Hotkeys
# Ctrl+Alt+{h,j,k,l,u} - tile windows
# Ctrl+Alt+T           - terminal
###

echo ---------------------------------------------
echo Shell script setup installer completed
echo ---------------------------------------------

