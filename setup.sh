#!/bin/sh
# Please run script as super user!
cat <<EOF
------------------------------------------------
Shell script setup installer for Manjaro systems
------------------------------------------------
EOF

# Update mirrorlist
rankmirrors -f

# Update packages
pacman -Syu --noconfirm \

### Install pacman applications here ###

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

### End pacman ###

# Install AUR package manager
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

# Switch to normal user
su $SUDO_USER <<EOF

# Update YAY
yay -Syu --noconfirm \

### Install AUR applications here ###

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

EOF

### Hotkeys
# Ctrl+Alt+{h,j,k,l,u} - tile windows
# Ctrl+Alt+T           - terminal
###

cat <<EOF
------------------------------------------------
Shell script setup installer completed
------------------------------------------------
EOF
