require "langbase"

vim.g.ale_enabled = 1
--vim.bo.ale_linters = { python  = {'flake8'} }
--vim.bo.ale_fixers = { python = {'yapf'} }

-- executed in REPL:
vim.keymap.set('n', '<space>a', 'yy<C-w><C-L>Go<esc>p2x<C-w><C-H>')  -- here 2x delete xonsh's prompt `>'
vim.keymap.set('v', '<space>a', 'y<C-w><C-L>Go<esc>p=G<C-w><C-H>')

-- executed in editor:
vim.keymap.set('v', '<space>v', [[y<C-w><C-w>pa<cr><C-\><C-n><C-w><C-w>]])
