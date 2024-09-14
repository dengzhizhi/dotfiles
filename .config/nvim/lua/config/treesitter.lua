local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "markdown",
}

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    "cpp",
    "lua",
    "vim",
    "javascript",
    "typescript",
    "clojure",
    "tsx",
    -- "markdown",
    -- "help",
    "comment",
    "latex",
    "java"
  },
  ignore_install = {"markdown"}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"markdown"}, -- list of language that will be disabled
    custom_captures = {
      ["require_call"] = "RequireCall",
    }
  },
  incremental_selection = {
    enable = false,

    keymaps = {
      init_selection = "<BS>",
      node_incremental = "<BS>",
      scope_incremental = "<S-BS>",
      node_decremental = "<C-BS>",
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["<space>,"] = "textsubjects-smart",
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<leader>n",
        goto_previous_usage = "<leader>p",
      },
    },
  },
  indent = { enable = true },
  playground = { enable = true },
})
