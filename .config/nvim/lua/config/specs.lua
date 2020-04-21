require('specs').setup{
  show_jumps  = true,
  min_jump = 5,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 2, -- time increments used for fade/resize effects
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 5,
    winhl = "Cursor",
    fader = require('specs').linear_fader,
    resizer = require('specs').slide_resizer,
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
}

vim.keymap.set('n', '<space>sp<space>', '<CMD>lua require("specs").toggle()<CR>', { noremap = true, silent = true })

local specs_line_cmd = [[<CMD>lua require("specs").show_specs(]]
  .. [[{width = 120, blend=20, winhl = "MarkWord3", inc_ms = 2, fader = require('specs').linear_fader, resizer = require('specs').empty_resizer}]]
  .. [[)<CR>]]

vim.api.nvim_set_keymap('n', '<space><space>', specs_line_cmd, { silent = true })
