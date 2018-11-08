# shell-setup
Script that sets up Xfce, Zsh, Neovim, and Tilix configurations on a newly installed system or backs up an existing one.

## Usage
Run setup.sh to deploy your configurations.

Run backup.sh to save your configurations.

## How do I save my own configurations?
There are several steps if you want to call it your own:

1. Fork your own copy of this repository.

2. Do a fresh install of your linux distro + Xfce -- or if you already have a system running you can skip this step!

3. Git clone your forked repository to your system.

4. Run the setup.sh <br>
**Note**: If you have Xfce, Tilix, Zsh, and Neovim already configured on your computer, you can skip this step and steps 5-8. <br>

5. Configure Xfce desktop -- keyboard shortcut, windows tiling, etc.

6. Configure Tilix -- color scheme, shortcuts, etc. <br>
**Note**: Type `tilix --preferences` if there is no gui options for opening up the settings -- I removed some of the gui in mine. <br>
**Note**: Put your custom color scheme files in ~/.config/tilix/schemes if loading from file (A file isn't necessary, Tilix will save a color scheme without a file).

7. Configure Zsh -- edit `~/.zshrc` -- add in your favorite Zsh plugins, setup aliases, etc. The Zsh plugin manager is Zplug.

8. Configure Neovim --edit `~/.config/nvim/init.vim` -- add in your favorite Vim plugins, setup Vim preferences, etc. The vim plugin manager is Vim-plug.

9. Run backup.sh to backup all of your configurations.

10. Git add, commit, and push your changes to your forked repository. Your configurations are now saved. Enjoy!

**Final Note**: The setup.sh may had some errors with some vim plugins, make sure to run `:PlugInstall` in Neovim to correct any bad installs.

## Resources

### Tilix
https://github.com/karlding/base16-tilix

### Zsh
https://wiki.archlinux.org/index.php/zsh

https://github.com/zplug/zplug

https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins

https://github.com/unixorn/awesome-zsh-plugins

### Neovim
https://github.com/neovim/neovim

https://github.com/junegunn/vim-plug

https://vimawesome.com/

https://github.com/chriskempson/base16-vim
