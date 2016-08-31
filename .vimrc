execute pathogen#infect()

" 
" Swap file directory
"
set directory^=$HOME/.vim/tmp//

let g:solarized_termcolors=256
set t_Co=256

colorscheme molokai
syntax on
set number
set undofile
set undodir=$HOME/.vim/undo
set background=dark
set tabstop=2
set shiftwidth=2

set autoindent
set cursorline " Line follows cursor
set ignorecase " For case insensitive search
set wildmenu " Better command-line completion
set guioptions-=m  "remove menu bar Gvim
set guioptions-=T  "remove toolbar Gvim
set noexpandtab

autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

filetype plugin indent on

vnoremap . :norm.<CR>
vnoremap ä @

" Helper functions
function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingEscInInsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif    
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction

function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
function! MyQuit()
  if TabIsEmpty() == 1
    q!
  else
    if &modified
      if (confirm("YOU HAVE UNSAVED CHANGES! Wanna quit anyway?", "&Yes\n&No", 2)==1)
        q!
      endif
    else
      q
    endif
  endif
endfunction
function! OpenLastBufferInNewTab()
    redir => ls_output
    silent exec 'ls'
    redir END
    let ListBuffers = reverse(split(ls_output, "\n"))
    for line in ListBuffers
      let title = split(line, "\"")[1]
      if title !~  "\[No Name"
        execute "tabnew +" . split(line, " ")[0] . "buf" 
        break
      endif       
    endfor  
endfunction

set nocompatible
set scrolloff=3
inoremap jj <ESC>

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

map <F2> :NERDTreeToggle<CR>

nnoremap te  :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap <Enter> i<Enter>

" 
" Ignore the arrow keys until we learn.
"
"
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Ctrl F - Find
call CreateShortcut("C-f", ":/", "in", "noTrailingIInInsert")
" Alt Right - Next tab
call CreateShortcut("A-Right", "gt", "inv")
" Alt Left - Previous tab
call CreateShortcut("A-Left", "gT", "inv")
" Ctrl Z - Undo
call CreateShortcut("C-z", "u", "in")
" Ctrl C - Quit
call CreateShortcut("C-c", ":call MyQuit()<enter>", "inv", "cmdInVisual")
