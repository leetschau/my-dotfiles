let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

let g:ale_enabled = 1
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['yapf']}

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
