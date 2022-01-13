let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

let R_assign = 2
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

autocmd FileType rmd nnoremap <leader>O :VoomToggle pandoc<CR>
imap >> %>%

VAMActivate github:jalvesaq/Nvim-R csv
