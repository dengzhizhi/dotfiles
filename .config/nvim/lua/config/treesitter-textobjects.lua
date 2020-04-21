require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["acl"] = "@class.outer",
        ["icl"] = "@class.inner",
        ["acd"] = "@conditional.outer",
        ["icd"] = "@conditional.inner",
        ["acm"] = "@comment.outer",
        ["icm"] = "@comment.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outter",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["iB"] = "@block.inner",
        ["aB"] = "@block.outer",
        ["a@"] = "@attribute.outer",
        ["i@"] = "@attribute.inner",
        ["ast"] = "@statement.outer",
        -- markdown
        ["ili"] = "@list_item.inner",
        ["ali"] = "@list_item.outer",
        ["icb"] = "@code_block.inner",
        ["acb"] = "@code_block.outer",
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = false,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<space>]a"] = "@parameter.inner",
        ["<space>]@"] = "@attribute.inner",
      },
      swap_previous = {
        ["<space>[a"] = "@parameter.inner",
        ["<space>[@"] = "@attribute.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- set jumps in the jumplist
      goto_next_start = {
        ["gnf"] = "@function.outer",
        ["gnif"] = "@function.inner",
        ["gncl"] = "@class.outer",
        ["gnicl"] = "@class.inner",
        ["gnip"] = "@parameter.inner",
        ["gnca"] = "@call.outer",
        ["gnica"] = "@call.inner",
      },
      goto_next_end = {
        ["gnF"] = "@function.outer",
        ["gniF"] = "@function.inner",
        ["gnCl"] = "@class.outer",
        ["gniCl"] = "@class.inner",
        ["gniP"] = "@parameter.inner",
        ["gnCa"] = "@call.outer",
        ["gniCa"] = "@call.inner",
      },
      goto_previous_start = {
        ["gpf"] = "@function.outer",
        ["gpif"] = "@function.inner",
        ["gpcl"] = "@class.outer",
        ["gpicl"] = "@class.inner",
        ["gpip"] = "@parameter.inner",
        ["gpca"] = "@call.outer",
        ["gpica"] = "@call.inner",
      },
      goto_previous_end = {
        ["gpF"] = "@function.outer",
        ["gpiF"] = "@function.inner",
        ["gpCl"] = "@class.outer",
        ["gpiCl"] = "@class.inner",
        ["gpiP"] = "@parameter.inner",
        ["gpCa"] = "@call.outer",
        ["gpiCa"] = "@call.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'double',
      peek_definition_code = {
        ["<space>df<space>"] = "@function.outer",
        ["<space>dF<space>"] = "@class.outer",
      },
    },
  },
}
