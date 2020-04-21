local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "single",
  code_action_icon = '♻️ ',
}

local opts = { silent = true }
vim.api.nvim_set_keymap("n", "<C-j>", ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap("n", "<space>k<space>", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
vim.api.nvim_set_keymap("n", "gh", ":Lspsaga lsp_finder<CR>", opts)
vim.api.nvim_set_keymap("n", "gp", ":Lspsaga preview_definition<CR>", opts)

-- code action
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>ca", ":<C-U>lua require('lspsaga.codeaction').code_action()<CR>", opts)
