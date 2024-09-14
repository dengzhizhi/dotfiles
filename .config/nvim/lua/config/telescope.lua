local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  extensions = {
  --   fzf = {
  --     fuzzy = true,                    -- false will only do exact matching
  --     override_generic_sorter = true,  -- override the generic sorter
  --     override_file_sorter = true,     -- override the file sorter
  --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                      -- the default case_mode is "smart_case"
  --   },
    ast_grep = {
      command = {
        "sg",
        "--json=stream",
        "-p",
      }, -- must have --json and -p
      grep_open_files = false, -- search in opened files
      lang = nil, -- string value, specify language for ast-grep `nil` for default
    },
  },
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        [";q"] = actions.close,
        ["<C-K>"] = actions.move_selection_previous,
        ["<C-J>"] = actions.move_selection_next,
        ["<C-P>"] = actions.move_selection_previous,
        ["<C-N>"] = actions.move_selection_next,
      },
      i = {
        [";q"] = actions.close,
        ["<C-K>"] = actions.move_selection_previous,
        ["<C-J>"] = actions.move_selection_next,
        ["<C-P>"] = actions.move_selection_previous,
        ["<C-N>"] = actions.move_selection_next,
      },
    },
  }
}

-- telescope.load_extension('luasnip')

-- telescope.load_extension('fzf')
telescope.load_extension('ast_grep')

vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/telescope-keymaps.vim')

