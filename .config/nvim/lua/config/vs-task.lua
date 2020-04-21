require("vstask").setup({
  cache_strategy = "last", -- can be "most" or "last" (most used / last used)
  use_harpoon = false, -- use harpoon to auto cache terminals
  telescope_keys = { -- change the telescope bindings used to launch tasks
      vertical = '<C-v>',
      split = '<C-p>',
      tab = '<C-t>',
      current = '<CR>',
  },
  autodetect = { -- auto load scripts
    npm = false
  },
  terminal = 'toggleterm',
  term_opts = {
    vertical = {
      direction = "vertical",
      size = "80"
    },
    horizontal = {
      direction = "horizontal",
      size = "10"
    },
    current = {
      direction = "float",
    },
    tab = {
      direction = 'tab',
    }
  }
})

vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/vstask_keymaps.vim')
