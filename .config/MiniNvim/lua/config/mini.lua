-- default settings
require("mini.ai").setup({})
require("mini.align").setup({})
-- require("mini.animate").setup({})
require("mini.bracketed").setup({})
require("mini.bufremove").setup({})
require("mini.cursorword").setup({})
require("mini.comment").setup({})
require("mini.fuzzy").setup({})
require("mini.jump").setup({})
require("mini.map").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})
require("mini.completion").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.jump2d").setup({
  mappings = {
    start_jumping = ';k',
  },
})
require('mini.bufremove').setup({})
require('mini.doc').setup({})
require('mini.surround').setup({})
require('mini.trailspace').setup({})

-- custom settings
require("config.base16")
require("config.starter")
require("config.statusline")
