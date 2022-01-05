runtime ../../langbase/nvim/init.vim

let g:pymode_lint = 0
let g:pymode_lint_on_fly = 0
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_folding = 0
let g:pymode_python = 'python3'

function! Vimux4IPython()
  call VimuxRunCommand("%cpaste")
  call VimuxRunCommand(@v, 1)
  call VimuxRunCommand("^d")
endfunction

nnoremap <leader>rp :call VimuxRunCommand("print(" . expand("<cword>") . ")")<CR>
nnoremap <leader>rh :call VimuxRunCommand("help(" . expand("<cword>") . ")")<CR>
nnoremap <leader>rs :call VimuxRunCommand("??" . expand("<cword>"))<CR>

nnoremap <leader>l :call VimuxRunCommand(getline("."))<CR>
nnoremap <leader>d :call VimuxRunCommand(getline("."))<CR>:call search('^.\+')<CR>
vnoremap <leader>d "vy :call Vimux4IPython()<CR>`>:call search('^.\+')<CR>
nnoremap <leader>a gg"vyG :call Vimux4IPython()<CR>

VAMActivate
  \ github:metakirby5/codi.vim
  "\ github:python-mode/python-mode
