require('mini.files').setup({
  mappings = {
    go_in_plus  = '<CR>',
  },
})

vim.keymap.set("n", "<space>ls<space>", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, {silent=true})
