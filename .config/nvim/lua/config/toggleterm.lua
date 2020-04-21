local toggleterm = require("toggleterm")

toggleterm.setup {
  open_mapping = [[<F7>]],
  hide_numbers = true,
  insert_mappings = true,
  start_in_insert = true,
  direction = 'horizontal'
}

vim.api.nvim_set_keymap("n", "<F8>", ":ToggleTermToggleAll<cr>", {})
