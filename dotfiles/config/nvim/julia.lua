require "langbase"

-- pkg: JuliaEditorSupport/julia-vim

vim.keymap.set('n', '<space>a', 'yy<C-w><C-L>Go<esc>p7x<C-w><C-H>')  -- here 7x delete the leading `julia> `
vim.keymap.set('v', '<space>a', 'y<C-w><C-L>Go<esc>p=G<C-w><C-H>')

