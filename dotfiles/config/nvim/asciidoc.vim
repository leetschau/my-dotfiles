let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

imap &c [source,shell,title='',caption="代码清单{chNo}-{counter:console_enhance_src_no} "]<CR>----<CR>----<ESC>2k020la

imap &n [NOTE]<CR>====<CR>====<ESC>O

