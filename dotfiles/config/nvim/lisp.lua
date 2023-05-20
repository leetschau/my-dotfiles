require "langbase"

vim.g.maplocalleader = ','

vim.keymap.set('n', '<space>e', '<cmd>ConjureEvalCurrentForm<cr>')
vim.keymap.set('n', '<space>t', '<cmd>ConjureEvalRootForm<cr>')
vim.keymap.set('n', '<space>f', '<cmd>ConjureEvalFile<cr>')

-- pkg: Olical/conjure
-- pkg: gpanders/nvim-parinfer
