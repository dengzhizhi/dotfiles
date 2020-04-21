local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        [";q"] = actions.close,
        ["<C-P>"] = actions.move_selection_previous,
        ["<C-N>"] = actions.move_selection_next,
      },
      i = {
        [";q"] = actions.close,
        ["<C-P>"] = actions.move_selection_previous,
        ["<C-N>"] = actions.move_selection_next,
      },
    },
  }
}

-- telescope.load_extension('luasnip')

vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/telescope-keymaps.vim')

