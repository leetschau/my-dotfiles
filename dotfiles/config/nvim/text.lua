require "base"

require("symbols-outline").setup({
  fold_markers = { '>', 'V' },
  auto_close = false,})

vim.keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')
-- pkg: easymotion/vim-easymotion
-- pkg: ervandew/supertab
-- pkg: geoffharcourt/vim-matchit
-- pkg: kien/ctrlp.vim
-- pkg: kien/rainbow_parentheses.vim
-- pkg: kshenoy/vim-signature
-- pkg: mbbill/undotree
-- pkg: mileszs/ack.vim
-- pkg: plasticboy/vim-markdown
-- pkg: rlue/vim-barbaric
-- pkg: scrooloose/nerdcommenter
-- pkg: scrooloose/nerdtree
-- pkg: szw/vim-maximizer
-- pkg: vim-airline/vim-airline
-- pkg: simrat39/symbols-outline.nvim

vim.cmd [[
  " airline
  set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  " nerdtree
  nnoremap <C-i> :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " ctrlp
  let g:ctrlp_custom_ignore = { 'dir': 'node_modules\|.git' }
  nnoremap <C-n> :CtrlPBuffer<CR>
  nnoremap <C-u> :CtrlPMRU<CR>

  " undo & undotree configs
  set undodir=$HOME/.local/undo/ "make sure this folder exists
  set undofile
  set undolevels=1000
  set undoreload=2000
  nnoremap <leader>u :UndotreeToggle<CR>

  " vim-maximizer
  nnoremap <silent><F3> :MaximizerToggle<CR>
  vnoremap <silent><F3> :MaximizerToggle<CR>gv
  inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

  " ack
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  " Rainbow Parenthesis
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \ 'ctermfgs': ['yellow', 'red', 'white', 'green', 'lightblue', 'lightred', 'lightgreen'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \   '*': {},
  \   'tex': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \   },
  \   'vim': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \   },
  \   'html': {
  \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \   },
  \   'css': 0,
  \ }
  \}

  " easymotion
  let g:EasyMotion_smartcase = 1
  nmap f <Plug>(easymotion-overwin-f2)
]]
