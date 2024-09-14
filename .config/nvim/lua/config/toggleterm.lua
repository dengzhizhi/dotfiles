local toggleterm = require("toggleterm")
local Terminal  = require('toggleterm.terminal').Terminal

toggleterm.setup {
  open_mapping = [[<F7>]],
  hide_numbers = true,
  insert_mappings = true,
  start_in_insert = true,
  direction = 'horizontal'
}
