set nocompatible	" no legacy vi compatibility
syntax enable
set encoding=utf-8

set lazyredraw          " redraw only when we need to.

set showmode
set showmatch " show matching bracket when hovering over one

set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevel=99

set modelines=0
set backspace=indent,eol,start
set cursorline

colorscheme mustang
set background=dark

filetype plugin indent on             " Indent using filetype files if they
set autoindent                        " Copy the indentation from the previous
set smartindent                       " Insert an extra indent level in some

set relativenumber
set ruler
set scrolloff=3 " have some context around the current line always on screen
set autoread " Auto-reload buffers when file changed on disk
set updatecount=0

set backup
set undofile
set undolevels=1000
set undoreload=1
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
set undodir=~/.vim/.undo//

set mouse=a " Use mouse to scroll

"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set gdefault    " substitutions apply globally, rather than current line
set pastetoggle=<F2> " Toggle paste mode so autoindents are not applied


"" Make searching a bit nicer
set hlsearch    " highlight search matches
set incsearch   " incremental search
set ignorecase  " searches are case insensitive
set smartcase   " unless they contain at least one capital letter
set showmatch

au FocusLost * :wa " Save file on lose focus

" --- Key mappings --- "
let mapleader = " " " Leader

nnoremap ; : " use ; for commands

" fix regex handling
nnoremap / /\v
vnoremap / /\v

" Leader mappings
nnoremap <leader><space> :noh<cr> " can use ,<space> to clear a the search
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>o :CtrlP<CR> " open a file
nnoremap <leader>s :mksession<CR> " Save vim open file layout
nnoremap <Leader>t :NERDTree<CR>
nnoremap <leader>vv <C-w>v<C-w>l " Open a new vertical split and switch to it
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " strip trailing whitespace

" Copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

" Window navigation
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

inoremap jj <ESC> " Press jj twice to Escape
nnoremap <Space> za " toggle the current fold

" Ruby
" ignore Bundler standalone/vendor installs & gems
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vsp $MYVIMRC<CR>
nmap <silent> <leader>ez :vsp ~/.zshrc<CR>
nmap <silent> <leader>et :vsp ~/.tmux.conf<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" --- Plugin --- "
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround' " change surroundings
Plug 'bronson/vim-trailing-whitespace' " Marks all trailing whitespace in red
Plug 'scrooloose/nerdtree' " File browser
Plug 'scrooloose/nerdcommenter' " Comment toggling
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finding
Plug 'vim-airline/vim-airline' " Status bar
Plug 'christoomey/vim-tmux-navigator' " tmux integration

" Look at in the future
" sjl/gundo.vim
" vim-scripts/gitignore

call plug#end()

" --- Plugin Settings --- "
" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0

let g:ctrlp_use_caching = 0
let ctrlp_search_command = {
  \ 'types': {
    \ 1: ['.git', 'git --git-dir=%s/.git ls-files -co --exclude-standard'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let ctrlp_search_command.fallback = 'ag %s -l --hidden --nocolor -g ""'
endif

let g:ctrlp_user_command = ctrlp_search_command

" airline
set laststatus=2 " Show all the time

" NERDTree
let NERDTreeShowHidden=1 " toggled via Shift+i

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
