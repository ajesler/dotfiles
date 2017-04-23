set nocompatible	" no legacy vi compatibility
syntax enable
set encoding=utf-8
set showcmd
set showmode
set modelines=0
set backspace=indent,eol,start
set undofile
set cursorline

set relativenumber
set ruler
set scrolloff=3 " have some context around the current line always on screen
set autoread " Auto-reload buffers when file changed on disk
set updatecount=0
" set list " show invisible characters

set backup
set backupdir=/private/tmp
set dir=/private/tmp


"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set colorcolumn=130

"" Leader
let mapleader = ","

nnoremap / /\v  " fix regex handling
vnoremap / /\v	" fix regex handling

set gdefault    " substitutions apply globally, rather than current line

"" Make searching a bit nicer
set hlsearch    " highlight search matches
set incsearch   " incremental search
set ignorecase  " searches are case insensitive
set smartcase   " unless they contain at least one capital letter
set showmatch
nnoremap <leader><space> :noh<cr> " can use ,<space> to clear a the search

"" Use tab key to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"" Unmap the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

au FocusLost * :wa " Save file on lose focus

" nnoremap ; : " use ; for commands

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " strip trailing whitespace
inoremap jj <ESC> " Press jj twice to Escape
:nnoremap <Space> za " toggle the current fold
" yank to system clipboard
map <leader>y "*y
nnoremap <leader>w <C-w>v<C-w>l " Open a new vertical split and switch to it
" vv to generate new vertical split
nnoremap <leader>vv <C-w>v<C-w>l

" Ruby
" ignore Bundler standalone/vendor installs & gems
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**
