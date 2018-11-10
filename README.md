# shell-setup
Script that sets up Xfce, Zsh, Neovim, and Terminator configurations on a newly installed system or backs up an existing one.

## Usage
Run setup.sh to deploy your configurations.

Run backup.sh to save your configurations.

## How do I save my own configurations?
There are several steps if you want to call it your own:

1. Fork your own copy of this repository.

2. Do a fresh install of your linux distro + Xfce -- or if you already have a system running you can skip this step!

3. Git clone your forked repository to your system.

4. Run the setup.sh <br>
**Note**: If you have Xfce, Terminator, Zsh, and Neovim already configured on your computer, you can skip this step and steps 5-8. <br>
**Note**: Occasionally "Whiskers Menu" will stop and ask to be restarted. Choose the option to restart. <br>
**Note**: There is a portion during Zplug install where it hangs on `==> Installation finished successfully!`. The installation will continue after this. It hangs for about a minute, do not exit or press any keys during this time.

5. Configure Xfce desktop -- keyboard shortcut, windows tiling, etc.

6. Configure Terminator -- color scheme, shortcuts, etc. <br>
**Note**: Type `tilix --preferences` if there is no gui options for opening up the settings -- I removed some of the gui in mine. <br>
**Note**: Edit your custom color scheme in `~/.config/terminator/config`.

7. Configure Zsh -- edit `~/.zshrc` -- add in your favorite Zsh plugins, setup aliases, etc. The Zsh plugin manager is Zplug.

8. Configure Neovim --edit `~/.config/nvim/init.vim` -- add in your favorite Vim plugins, setup Vim preferences, etc. The vim plugin manager is Vim-plug.

9. Run backup.sh to backup all of your configurations.

10. Git add, commit, and push your changes to your forked repository. Your configurations are now saved. Enjoy!

**Final Note**: The setup.sh may had some errors with some vim plugins, make sure to run `:PlugInstall` in Neovim to correct any bad installs.

## Resources

### Terminator
https://github.com/chriskempson/base16 <br>
Look at termux's github page, You can reference the color scheme for terminator <br>
For example: https://github.com/kdrag0n/base16-termux/blob/master/colors/base16-atelier-forest.properties

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
