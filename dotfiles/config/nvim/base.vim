filetype indent plugin on
syntax on
set spelllang=en,cjk
colo slate

set clipboard+=unnamedplus
let mapleader=","
let maplocalleader = ","
set nobackup
set noswapfile
set splitbelow
set splitright
set incsearch
set et
set sw=2
set ts=2
set nowrap
set number
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,noselect
set pastetoggle=<F4>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>s :so $MYVIMRC<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F2> :set wrap!<CR>

" Font color for line longer than 80 characters
highlight OverLength ctermfg=cyan guibg=#592929
match OverLength /\%81v.\+/

cabbrev ss set spell!<CR>


