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
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

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

" Set guide indents
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey19   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey27 ctermbg=4

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
            \       '+': 'xclip -selection clip',
            \     },
            \    'paste': {
            \       '*': 'xclip -selection primary -o',
            \       '+': 'xclip -selection clip -o',
            \    },
            \    'cache_enabled': 1,
            \}

" New leader key
let mapleader = ";"

" EASY MOTION
" Two letter search
nmap <Leader><Leader> <Plug>(easymotion-overwin-f2)
" Reset easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" JavaComplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
let g:JavaComplete_EnableDefaultMappings = 0

" NERDTree
map <C-m> :NERDTreeToggle<CR>

