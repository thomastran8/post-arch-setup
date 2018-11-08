# shell-setup
Script that sets up zsh, neovim, and tilix configurations on a newly installed XFCE desktop environment or backs up an existing one.

## Usage
Run setup.sh to deploy your configurations

Run backup.sh to save your configurations

## How do I save my own configurations?
There are several steps if you want to call it your own:

1. Fork your own copy of this repository

2. Do a fresh install of Manjaro -- or if you are using Manjaro already you can skip this step!

3. Git clone this repo to your Manjaro system

4. Run the setup.sh <br>
**Note**: If you have xfce, tilix, zsh, and neovim already configured on your computer, you can skip this step and steps 5-8 <br>

5. Configure xfce desktop -- keyboard shortcut, windows tiling settings, etc.

6. Configure tilix -- color scheme, shortcuts, etc. <br>
**Note**: Type `tilix --preferences` if there is no gui options for opening up the settings -- I removed some of the gui in mine <br>
**Note**: Put your custom color scheme files in ~/.config/tilix/schemes if loading from file (file isn't necessary, tilix will save color scheme without a file)

7. Configure zsh -- edit ~/.zshrc -- add in your favorite zsh plugins, setup aliases, etc.

8. Configure neovim --edit ~/.config/nvim/init.vim -- add in your favorite vim plugins, setup vim preferences, etc.

9. Run backup.sh to backup all of your configurations

10. Git add, commit, and push your changes to your repo. Your config is now stored on your repo. Enjoy!

## Where do I find resources to customize my configurations?

### Tilix
https://github.com/karlding/base16-tilix

### Zsh
https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
https://github.com/unixorn/awesome-zsh-plugins

### Neovim
https://vimawesome.com/
https://github.com/chriskempson/base16-vim
