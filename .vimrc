execute pathogen#infect()
colorscheme monokai 
syntax on
filetype plugin indent on
set number
set smarttab
set autoindent
vnoremap . :norm.<CR>
vnoremap ä @

set nocompatible
set scrolloff=3
inoremap jj <ESC>

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Open nerdtree if no file selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <F2> :NERDTreeToggle<CR>

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>

