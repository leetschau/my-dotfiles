let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

set rtp^="/home/leo/.opam/default/share/ocp-indent/vim"

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

