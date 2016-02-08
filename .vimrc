execute pathogen#infect()
syntax on
colorscheme Monokai 
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

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>

