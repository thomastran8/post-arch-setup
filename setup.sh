#!/bin/sh

cat <<EOF
------------------------------------------------
Shell script setup installer for Manjaro systems
------------------------------------------------
EOF

# Check if running as root
if [[ $EUID -eq 0 ]]; then
        echo "Do not run as root."
        exit
fi

# Update mirrorlist
sudo rankmirrors -f

# Update packages
sudo pacman -Syu --noconfirm \

### Install pacman applications here ###

# Install zsh
zsh \

# Install neovim
neovim \

# Install tilix
tilix \

# Install xclip for neovim clipboard
xclip

### End pacman ###

# Install AUR package manager
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd -
rm -rf ~/yay

# Update YAY
yay -Syu --noconfirm \

### Install AUR applications here ###

# Install zplug
zplug \

# Install fonts and glyphs
nerd-fonts-complete-mono-glyphs \

# Install vim-plug
neovim-plug

### End AUR ###

# Install python modules for neovim
pip3 install neovim --user

# Install tilix color scheme;
if [[ ! -f ~/.config/tilix/schemes/base16-atelier-plateau.json ]]; then
    mkdir -p ~/.config/tilix/schemes
    wget https://raw.githubusercontent.com/karlding/base16-tilix/master/tilix/base16-atelier-plateau.json -O ~/.config/tilix/schemes/base16-atelier-plateau.json
fi

# Copy files to corresponding directories
cp ./zsh/zshrc ~/.zshrc
mkdir -p ~/.config/nvim
cp ./neovim/init.vim ~/.config/nvim/init.vim
dconf load /com/gexperts/Tilix/ < ./tilix/tilix.dconf

# Default to zsh
chsh -s $(which zsh)

# Install plugins
zsh                     # switch to zsh
zplug install
nvim +'PlugInstall --sync' +qa;

### Hotkeys
# Ctrl+Alt+{h,j,k,l,u} - tile windows
# Ctrl+Alt+T           - terminal
###

cat <<EOF
------------------------------------------------
Shell script setup installer completed
------------------------------------------------
EOF
