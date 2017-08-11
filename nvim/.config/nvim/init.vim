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

" Set the tags source
set tags=./tags

" colorscheme mustang
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
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swap//
set undodir=~/.config/nvim/.undo//

set mouse=a " Use mouse to scroll

"" Whitespace
set wrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set gdefault    " substitutions apply globally, rather than current line
set pastetoggle=<F2> " Toggle paste mode so autoindents are not applied

"" Copy and paste
set clipboard=unnamedplus
" yy => copies to clipboard
" p  => pastes from clipboard

"" Make searching a bit nicer
set hlsearch    " highlight search matches
set incsearch   " incremental search
set ignorecase  " searches are case insensitive
set smartcase   " unless they contain at least one capital letter
set showmatch

" --- Key mappings --- "
let mapleader = " " " Leader

"" Make copy as expected (ish)
vnoremap <C-c> "*y

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" fix regex handling
nnoremap / /\v
vnoremap / /\v

" Use tab to jump between brackets
nnoremap <tab> %
vnoremap <tab> %

" Leader mappings
nnoremap <leader><space> :noh<cr> " can use <leader><space> to clear the search
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " strip trailing whitespace
nnoremap <leader>l :mksession<CR> " Save vim open file layout

vmap <C-F> :cclose<CR>y:silent Ag "<C-R>""<CR>
nmap <C-F> :cclose<CR>yiw:silent Ag "<C-R>""<CR>

" Close a window panel
nmap <leader>c <C-w>c
" Use <leader>v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Use <leader>s to open a new horizontal split and switch to it
nnoremap <leader>s <C-w>s<C-w>j

" nnoremap <leader>g :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

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
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap jj <ESC> " Press jj twice to Escape
" nnoremap <Space> za " toggle the current fold

" Ruby
" ignore Bundler standalone/vendor installs & gems
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ez :e ~/.zshrc<CR>
nmap <silent> <leader>et :e ~/.tmux.conf<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" --- Plugin --- "
call plug#begin('~/.config/nvim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround' " change surroundings
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary' " toggle comments
Plug 'bronson/vim-trailing-whitespace' " Marks all trailing whitespace in red
Plug 'scrooloose/nerdtree' " File browser
Plug 'vim-airline/vim-airline' " Status bar
Plug 'christoomey/vim-tmux-navigator' " tmux integration
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'tpope/vim-rails'

" Plug 'neomake/neomake'
" Plug 'tpope/vim-bundler'

" Look at in the future
" sjl/gundo.vim
" vim-scripts/gitignore

call plug#end()

" --- Plugin Settings --- "
" vim-rails
let g:Tlist_Ctags_Cmd = 'ripper-tags -R --exclude=vendor'
let g:rails_ctags_arguments = ''


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
