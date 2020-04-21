local keymap = vim.api.nvim_set_keymap

keymap("n", "<Space>su<Space>",  ":NERDTreeFocus<CR>",  {silent=true})
keymap("n", "<Space>so<Space>",  ":NERDTreeToggle<CR>", {silent=true})
keymap("n", "<Space>si<Space>",  ":NERDTreeFind<CR>",   {silent=true})

