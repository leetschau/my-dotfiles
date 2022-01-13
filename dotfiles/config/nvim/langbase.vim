let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/text.vim'

let g:ale_enabled = 1

set colorcolumn=80

VAMActivate
  \ github:dense-analysis/ale
  \ github:sbdchd/neoformat
  \ github:tpope/vim-fugitive
  \ github:preservim/vimux
  \ github:sheerun/vim-polyglot
