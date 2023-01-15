require "langbase"

local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      sh = {
        command = {"zsh"}
      },
      julia = { command = {"julia"} }
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

vim.keymap.set('n', '<space>a', 'yy<C-w><C-L>Go<esc>p7x<C-w><C-H>')  -- here 7x delete the leading `julia> `
vim.keymap.set('v', '<space>a', 'y<C-w><C-L>Go<esc>p=G<C-w><C-H>')
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
