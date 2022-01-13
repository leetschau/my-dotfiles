let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

" follow https://wiki.haskell.org/Programming_guidelines
" and https://kowainik.github.io/posts/2019-02-06-style-guide

set sw=4
set ts=4
set colorcolumn=90

nnoremap <C-q> :execute ':!stack hoogle -- -i <cword>'<CR>

