let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

let g:formatdef_sql = '"sqlformat --keywords upper --identifiers lower -"'
let g:formatters_sql = ['sql']
noremap <leader>f :Autoformat<CR>

autocmd BufNewFile,BufRead *.hql set filetype=sql

let g:snipMate = { 'snippet_version' : 1 }

VAMActivate github:Chiel92/vim-autoformat                                                                                             
  \ github:garbas/vim-snipmate
  \ vim-snippets
