#!/bin/sh
# UNDER CONSTRUCTION
cat <<EOF
------------------------------------------------
Shell script setup installer for Arch systems
------------------------------------------------
EOF

# Check if running as root
if [[ $EUID -eq 0 ]]; then
        echo "Do not run as root."
        exit
fi

overwrite_files()
{
    # Copy files to corresponding directories
    cp ./zsh/zshrc ~/.zshrc
    mkdir -p ~/.config/nvim
    cp ./neovim/init.vim ~/.config/nvim/init.vim
    #TODO: overwrite i3 files
    #TODO: overwrite urxvt files
    #TODO: overwrite mpd /etc location
    mkdir -p ~/.config/rofi
    cp ./rofi/config ~/.config/rofi/config
    mkdir -p ~/remote   # For sshfs
    # Create directory for wallpapers
    mkdir -p ~/wallpapers/wallpaper-main
    cp ./wallpaper/* ~/wallpapers/wallpaper-main

}

# Overwrite files
while true; do
    read -p "Warning: Current system configuration files will be overwritten
    Would you like to overwrite the files now? [y/n]: " yn
    case $yn in
        [Yy]* ) overwrite_files; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# Comment out colorscheme in neovim init
sed -i "s/colorscheme/\"colorscheme/g" ~/.config/nvim/init.vim

# Update mirrorlist
while true; do
    read -p "Do you wish to update mirrorlists? [y/n]: " yn
    case $yn in
        [Yy]* ) sudo pacman -S reflector --noconfirm
		sudo reflector --latest 30 --sort rate --country "United States" --save /etc/pacman.d/mirrorlist
		break
		;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Update colors for pacman
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

# Update pacman and install packages
sudo pacman -Syu --noconfirm \
zsh \
neovim \
intel-ucode \
xorg \
intel-ucode \ # intel microcode
xorg \
xorg-xinit \
mesa \ # may be already installed
vulkan-intel \
i3 \
redshift \ # not working
ttf-dejavu \
zplug \
tmux \
firefox \
neofetch \
ranger \
rofi \
htop \
feh \
imagemagick \
mpv \
scrot \
pulseaudio \ # requires restart
pamixer \
pavucontrol \ # optional, nice to have
pcmanfm \ # optional, nice to have
pastebinit \
xdg-user-dirs \
arandr \
libreoffice \
network-manager-applet \ # optional, nice to have
gtop \
fuse \ # requires restart
noto-fonts-emoji \ # refresh i3
udisks2 \
udiskie \
dunst \
mpd \
mpc \
ncmpcpp \
libmpdclient \ # install before polybar
xclip \
transmission-cli \
inotify-tools \
sshfs \
pacman-contrib \
python-pip \
npm \
w3m \
diffuse \
rust \ # needed for markdown-composer
keepassxc \
unzip \
jdk-openjdk

# Install AUR package manager
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -sic --noconfirm
cd -
rm -rf ~/yay

# Update YAY and install packages
yay -Syu --noconfirm \
zplug \
nerd-fonts-dejavu-complete \
neovim-plug-git \
systemd-numlockontty \
polybar \
cryptomator \
megasync \
rxvt-unicode-truecolor \
light \
fontviewer \
spotify \
neovim-plug \
nodejs-base16-builder-git

# Install python modules for neovim
pip3 install neovim --user

# Install plugins
zsh -c "source ~/.zshrc; zplug install; nvim +PlugInstall +qa;"

# Uncomment colorscheme in neovim init
sed -i "s/\"colorscheme/colorscheme/g" ~/.config/nvim/init.vim

#TODO: reload i3
#TODO: pip3 install --user --upgrade pynvim
#TODO: sudo npm install --global base16-builder

# Default to zsh
chsh -s $(which zsh)

cat <<EOF
------------------------------------------------
Shell script setup installer completed
------------------------------------------------
EOF
