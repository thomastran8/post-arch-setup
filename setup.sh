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
while true; do
    read -p "Do you wish to update mirrorlists? [y/n]: " yn
    case $yn in
        [Yy]* ) sudo rankmirrors -f; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Update pacman and install packages
sudo pacman -Syu --noconfirm \
zsh \
neovim \
tilix \
xclip

# Install AUR package manager
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -sic --noconfirm
cd -
rm -rf ~/yay

# Update YAY and install packages
yay -Syu --noconfirm \
zplug \
nerd-fonts-complete-mono-glyphs \
neovim-plug

# Install python modules for neovim
pip3 install neovim --user

# Install tilix color scheme;
if [[ ! -f ~/.config/tilix/schemes/base16-atelier-forest.json ]]; then
    mkdir -p ~/.config/tilix/schemes
    wget https://raw.githubusercontent.com/karlding/base16-tilix/master/tilix/base16-atelier-forest.json -O ~/.config/tilix/schemes/base16-atelier-forest.json
fi

# Copy files to corresponding directories
cp ./zsh/zshrc ~/.zshrc
mkdir -p ~/.config/nvim
cp ./neovim/init.vim ~/.config/nvim/init.vim
cp ./shortcuts/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
dconf load /com/gexperts/Tilix/ < ./tilix/tilix.dconf

# Default to zsh
chsh -s $(which zsh)

# Install plugins
zsh                     # switch to zsh
zplug install
nvim +'PlugInstall --sync' +qa;

cat <<EOF
------------------------------------------------
Shell script setup installer completed
------------------------------------------------
EOF
