#!/bin/sh

cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./neovim/
cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ./shortcuts/
dconf dump /com/gexperts/Tilix/ > ./tilix/tilix.dconf

