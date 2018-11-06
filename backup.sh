#!/bin/sh

cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./neovim/init.vim
dconf dump /com/gexperts/Tilix/ > ./tilix/tilix.dconf

