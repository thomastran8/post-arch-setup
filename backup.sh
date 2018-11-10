#!/bin/sh

# Move into the current directory
cd "$(dirname "$0")"

while true; do
    read -p "Would you like to backup Xfce files? [y/n]: " yn
    case $yn in
        [Yy]* ) cp -r ~/.config/xfce4 ./shortcuts/; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./neovim/
cp ~/.config/terminator/config ./terminator/
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

