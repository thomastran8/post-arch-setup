#!/bin/sh

# Move into the current directory
cd "$(dirname "$0")"

# Backup i3
cp ~/.config/i3/config ./i3
cp ~/.xinitrc ./i3/xinitrc
# Backup polybar
cp -r ~/.config/polybar ./polybar
# Backup mpd
cp ~/.config/mpd/mpd.conf ./mpd
cp /etc/pulse/client.conf ./mpd
# Backup ncmpcpp
cp ~/.ncmpcpp/config ./ncmpcpp
# Backup zsh .zprofile
cp ~/.zshrc ./zsh/zshrc
cp ~/.zprofile ./zsh/zprofile
# Backup dunst
cp /.config/dunst/dunstrc ./dunst
# Backup urxvt
cp ~/.Xresources ./urxvt
# Backup neovim
cp ~/.config/nvim/init.vim ./neovim
# Backup rofi
cp ~/.config/rofi/config ./rofi
# Backup torrent scripts
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

