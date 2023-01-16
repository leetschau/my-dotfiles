require "text"

-- pkg: dense-analysis/ale
-- pkg: hkupty/iron.nvim
-- pkg: kien/ctrlp.vim
-- pkg: preservim/tagbar
-- pkg: preservim/vimux
-- pkg: sbdchd/neoformat
-- pkg: sheerun/vim-polyglot
-- pkg: tpope/vim-fugitive
-- pkg: tpope/vim-unimpaired

vim.g.ale_enabled = 1
vim.opt.colorcolumn = "80"

local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      sh = {
        command = {"zsh"}
      },
      julia = { command = {"julia"} },
      python = { command = {"/home/leo/docs/drift-study/.venv/bin/xonsh"} },
      -- When execute in a virtualenv, change command path to the full path of
      -- Python interpreter provided by `poetry env info` or something else.
      -- For example: "/home/leo/.cache/pypoetry/virtualenvs/driftstudy-NYOhBOOU-py3.10/bin/xonsh"
      r = { command = { "radian" } },
    },
    repl_open_cmd = view.split.vertical.topleft("50%"),
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>v",
    send_file = "<space>f",
    send_line = "<space>l",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  highlight = {
    italic = true
  },
  ignore_blank_lines = true,
}

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')