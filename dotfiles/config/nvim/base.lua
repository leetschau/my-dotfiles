vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.number = true
vim.opt.wrap = false
vim.opt.spelllang = {'en', 'cjk'}
vim.opt.mouse = ""

vim.g.mapleader = ','

vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<C-H>', '<C-w><C-H>')
vim.keymap.set('n', '<C-J>', '<C-w><C-J>')
vim.keymap.set('n', '<C-K>', '<C-w><C-K>')
vim.keymap.set('n', '<C-L>', '<C-w><C-L>')
vim.keymap.set('t', '<C-H>', '<C-w><C-H>')
vim.keymap.set('t', '<C-J>', '<C-w><C-J>')
vim.keymap.set('t', '<C-K>', '<C-w><C-K>')
vim.keymap.set('t', '<C-L>', '<C-w><C-L>')

vim.keymap.set('n', '<leader>h', ':set hls!<CR>')
-- vim.keymap.set('n', '<leader>e', ':edit $MYVIMRC<cr>') not work
vim.keymap.set('n', '<leader>e', ':edit ' .. vim.call('stdpath', 'config') .. '/init.lua<cr>')
vim.keymap.set('n', '<leader>s', ':source ' .. vim.call('stdpath', 'config') .. '/init.lua <cr>')

vim.cmd('colorscheme slate')
vim.cmd('cabbrev ss set spell!<CR>')
