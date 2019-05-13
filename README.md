# post-arch-setup
Script that sets up i3, Polybar, URxvt, Mpd, Ncmpcpp, Zsh, and Neovim configurations on a newly installed Arch system or backs up an existing one.

## Usage
Run setup.sh to deploy your configurations.

Run backup.sh to save your configurations.

## How do I save my own configurations?
There are several steps if you want to call it your own:

1. Fork your own copy of this repository.

2. Do a fresh install of Arch -- or if you already have one running you can skip this step!

3. Git clone your forked repository to the Arch system.

4. Run the setup.sh. This will deploy the saved configuration in this repository. <br>
**Note**: There is a portion during Zplug install where it hangs on `==> Installation finished successfully!`. The installation will continue after this. It hangs for about a minute, do not exit or press any keys during this time.

5. Configure your Arch system to your preferences. These are mainly dotfiles found in the user's ~/.config folder and the user's home folder. Refer to backup.sh in this repository to see which files get backed up.

9. Once you are happy with your system configuration, run backup.sh to backup all of your configurations.

10. Git add, commit, and push your changes to your forked repository. Your configurations are now saved. Enjoy!

**Final Note**: The setup.sh may had some errors with some vim plugins, make sure to run `:PlugInstall` in Neovim to correct any bad installs.

## Resources

### Base16 Color Schemes
These are simple but effective color schemes. There's a color scheme for everyone! <br>
Use the base16-builder to generate a base16 color config for your application

https://github.com/base16-builder/base16-builder

### Zsh

https://github.com/zplug/zplug

### Neovim

https://github.com/junegunn/vim-plug

https://vimawesome.com/
