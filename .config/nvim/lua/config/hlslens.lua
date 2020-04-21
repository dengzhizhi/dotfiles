require('hlslens').setup({
    calm_down = true,
    nearest_only = true,
})

vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/hlslens_keymaps.vim')
