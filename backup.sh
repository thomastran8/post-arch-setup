#!/bin/sh

# Move into the current directory
cd "$(dirname "$0")"

#TODO: backup i3 files .xinitrc
#TODO: backup urxvt files .Xresources
#TODO: backup polybar files
#TODO: backup mpd files ~/.mpd ~/etc/pulse/client.conf
#TODO: backup ncmpcpp
#TODO: backup zsh .zprofile
#TODO: backup dunst
cp ~/.Xresources ./urxvt
cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./neovim
cp ~/.config/terminator/config ./terminator
cp ~/.config/rofi/config ./rofi
cp ~/torrents/scripts/* ./torrents/scripts
sed -i "/ExecStart/c\ExecStart=/home/_USER_/torrents/scripts/watchdir.sh" ./torrents/scripts/watchdir.service
sed -i "/User/c\User=_USER_" ./torrents/scripts/watchdir.service

# Move back
cd -

cat <<EOF
---------------
Backup Complete
---------------
EOF

