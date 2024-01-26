set nocompatible	" no legacy vi compatibility
syntax enable
set encoding=utf-8

set lazyredraw          " redraw only when we need to.

set showmode
set showmatch " show matching bracket when hovering over one

set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevel=99        " fold level that will be applied when opening files

set modelines=0
set backspace=indent,eol,start
set cursorline

set cmdheight=2         " Increase the status bar height to allow more room for ALE messages

" Set the tags source
set tags=./tags

filetype plugin indent on             " Indent using filetype files if they
set autoindent                        " Copy the indentation from the previous
set smartindent                       " Insert an extra indent level in some

set relativenumber
set number
set ruler
set scrolloff=3 " have some context around the current line always on screen
set autoread " Auto-reload buffers when file changed on disk
set updatecount=0

set noswapfile
set backup
set backupdir=~/.config/nvim/.backup//
set undofile
set undolevels=1000
set undoreload=1
set undodir=~/.config/nvim/.undo//

set mouse=a " Use mouse to scroll

"" Whitespace
set wrap
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set gdefault    " substitutions apply globally, rather than current line
set pastetoggle=<F2> " Toggle paste mode so autoindents are not applied

" auto writing
set autowrite     " write when leaving buffer
set autowriteall  " write when leaving buffer (always)
" autocmd FocusLost * silent! :wall " write on loss of focus
autocmd BufLeave * silent! :wall
autocmd FocusLost * silent! :wall

"" Copy and paste
set clipboard+=unnamedplus
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
let maplocalleader = ","

"" Make copy as expected (ish)
vnoremap <C-c> "*y

nnoremap <tab><tab> :tab split<cr>
nnoremap <backspace><backspace> :tabclose<cr>

" Maximise and minimise buffer
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" copy current file name (relative/absolute) to system clipboard
" if has("mac") || has("gui_macvim") || has("gui_mac")
" relative path  (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>

" absolute path  (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" filename       (foo.txt)
nnoremap <leader>cn :let @+=expand("%:t")<CR>

" directory name (/something/src)
nnoremap <leader>cd :let @+=expand("%:p:h")<CR>
" endif

" fix regex handling
nnoremap / /\v
vnoremap / /\v

" Leader mappings
nnoremap <leader><space> :noh<cr> " can use <leader><space> to clear the search
nnoremap <leader>f :Files<CR>
nnoremap <leader>rf :set filetype=ruby<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :NERDTreeFind<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " strip trailing whitespace
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
xnoremap <leader>co :copen

" Edit URLs to allow clipboard and restrict to a single monitor
nnoremap <leader>cv /clipboardwlllxi0nwwwwxi1/multimonwlllxa00dd<CR>

" " delete without yanking
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d

" " replace currently selected text with default register
" " without yanking it
vnoremap <leader>p "_dP
xnoremap <leader>p "_dP

" RSpec.vim mappings
map <Leader>rs :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
map <Leader>rr :Copen<CR>G<CR>

" Fugitive shortcuts
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gs :Git status<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gd :GFiles?<CR>

vmap <C-F> :cclose<CR>y:silent Ag <C-R>"<CR>
nmap <C-F> :cclose<CR>yiw:silent Ag <C-R>"<CR>

" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" Close a window panel
" Use <leader>v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Use <leader>s to open a new horizontal split and switch to it
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>co :copen<CR>

" nnoremap <leader>g :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" Act like D and C
nnoremap Y y$

" Copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

" Tab navigation
" nnoremap J :tabprev<CR>
" nnoremap K :tabnext<CR>

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

" Hatch notes
nmap <silent> <leader>el :vnew ~/Documents/notes/daily.md<CR>

" From https://github.com/garybernhardt/dotfiles/blob/e0786e861687af64b7ea3f1b9f2b66a8bfbfe6bf/.vimrc#L400-L428
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate(new_split)
  let new_file = AlternateForCurrentFile()
  if a:new_split
    exec ':new ' . new_file
  else
    exec ':e ' . new_file
  endif
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1  || match(current_file, '\<services\>') != -1 || match(current_file, '\<queries\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>z :call OpenTestAlternate(0)<cr>
nnoremap <leader>zs :call OpenTestAlternate(1)<cr>


" --- Plugin --- "
call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround' " change surroundings
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary' " toggle comments
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace' " Marks all trailing whitespace in red
Plug 'scrooloose/nerdtree' " File browser
Plug 'vim-airline/vim-airline' " Status bar
Plug 'christoomey/vim-tmux-navigator' " tmux integration
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kshenoy/vim-signature' " show marks in the gutter
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'iCyMind/NeoSolarized'
Plug 'ddrscott/vim-side-search'
Plug 'github/copilot.vim'

" Go
" Plug 'fatih/vim-go'

" Ruby
Plug 'nelstrom/vim-textobj-rubyblock'

" Rails
Plug 'tpope/vim-rails'

call plug#end()

" --- Plugin Settings --- "
set background=dark
colorscheme dracula

" fzf
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:80%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" vim-rails
let g:Tlist_Ctags_Cmd = 'ripper-tags -R --exclude=vendor'
let g:rails_ctags_arguments = ''

" vim-rspec
let g:rspec_command = 'Dispatch bundle exec rspec {spec}'

" ale
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'ruby': ['rubocop'],
\}

" let g:rspec_command = ':call ShowRSpecOutput("{spec}")'
function! ShowRSpecOutput(specs)
  " http://learnvimscriptthehardway.stevelosh.com/chapters/52.html#scratch-splits
  " Run the spec
  let spec_run_results = system('rspec ' . a:specs)

  " Open a new split and set it up
  split __RSpec_Output__
  " clear the buffer
  normal! ggdG
  " never save the buffer
  setlocal buftype=nofile

  call append(0, split(spec_run_results, '\v\n'))
endfunction

" vim-go
" let g:go_fmt_command = "goimports"
" let g:go_highlight_types = 1
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1

" augroup go
"   autocmd!

"   " Show by default 4 spaces for a tab
"   autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"   " go fmt on save - this happens out of the box with vim-go?
"   " autocmd BufWrite *.go :GoFmt

"   " :GoBuild and :GoTestCompile
"   autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

"   " :GoRun
"   autocmd FileType go nmap <leader>gr  <Plug>(go-run)

"   autocmd FileType go nmap <leader>gd  :GoDec

"   " :GoDoc
"   autocmd FileType go nmap <leader>gi <Plug>(go-doc)

"   " :GoAlternate  commands :A and :AT
"   autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"   autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" augroup END

" " build_go_files is a custom function that builds or compiles the test file.
" " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#cmd#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction

" airline
set laststatus=2 " Show all the time
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" How should we execute the search?
" --heading and --stats are required!
let g:side_search_prg = 'ag'
 \. " --ignore='*.js.map'"
 \. " --heading --stats -B 1 -A 4"

" Can use vnew or new
let g:side_search_splitter = 'new'
let g:side_search_split_pct = 0.3
