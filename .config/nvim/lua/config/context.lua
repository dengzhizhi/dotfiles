vim.g.context_enabled = 0

vim.api.nvim_set_keymap('n', '<space>se;<space>', ':ContextToggleWindow<cr>', {}) 
vim.api.nvim_set_keymap('n', '<space>sej<space>', ':ContextDisable<cr>:set nowrap<cr>:vsp<cr>gd<c-w>p30<c-w>\\|<c-w>p', {}) 
vim.api.nvim_set_keymap('n', '<space>sek<space>', ':ContextPeek<cr>', {}) 
