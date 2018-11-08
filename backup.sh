#!/bin/sh

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
dconf dump /com/gexperts/Tilix/ > ./tilix/tilix.dconf
cp ~/.config/tilix/schemes/* ./tilix/schemes

cat <<EOF
---------------
Backup Complete
---------------
EOF

