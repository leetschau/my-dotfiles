let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

VAMActivate github:rust-lang/rust.vim
  \ github:neoclide/coc.nvim
