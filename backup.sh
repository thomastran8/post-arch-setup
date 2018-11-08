#!/bin/sh

cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./neovim/
cp -r ~/.config/xfce4 ./shortcuts/
dconf dump /com/gexperts/Tilix/ > ./tilix/tilix.dconf

