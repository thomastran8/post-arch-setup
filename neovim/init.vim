call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'
Plug 'suan/vim-instant-markdown'

" Make sure neovim is installed with pip3 first
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Additional autocomplete for java
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

" Set airline icons
let g:airline_powerline_fonts = 1

" For base16 vim theme
set termguicolors

" Set vim theme
colorscheme base16-atelier-plateau

" Shows line number
set number

" Set tabs to space
set tabstop=4 shiftwidth=4 expandtab

" Custom clipboard
let g:clipboard = {
            \    'name': 'xclip',
            \    'copy': {
            \       '*': 'xclip -selection primary',
            \       '+': 'xclip -selection secondary',
            \     },
            \    'paste': {
            \       '*': 'xclip -selection primary -o',
            \       '+': 'xclip -selection secondary -o',
            \    },
            \    'cache_enabled': 1,
            \}

