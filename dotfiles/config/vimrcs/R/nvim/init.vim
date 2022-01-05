runtime ../../langbase/nvim/init.vim

let R_assign = 2
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

autocmd FileType rmd nnoremap <leader>O :VoomToggle pandoc<CR>
imap >> %>%

VAMActivate github:jalvesaq/Nvim-R csv
