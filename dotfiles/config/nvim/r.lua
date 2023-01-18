require "langbase"

vim.keymap.set('i', '>>', ' %>% ')
vim.keymap.set('i', '<<', ' <- ')

vim.keymap.set('n', '<space>a', 'yy<C-w><C-L>Go<esc>p2x<C-w><C-H>')  -- here 2x delete the leading `> `
vim.keymap.set('v', '<space>a', 'y<C-w><C-L>Go<esc>p=G<C-w><C-H>')
