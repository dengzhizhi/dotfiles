local utils = require("utils")
local fn = vim.fn

local vscode = vim.g.vscode ~= nil and true or false

require("lazy").setup({
  { "wbthomason/packer.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lua/plenary.nvim" },
  { 'echasnovski/mini.nvim',
    version = '*',
    config = function() require('config.mini') end,
  },
  -- File search, tag search and more
  { 'Yggdroot/LeaderF',
    build = function()
      if not vim.g.is_win then
        vim.cmd [[LeaderfInstallCExtension]]
      end
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    config = function()
      require("neogit").setup({})
    end,
  },
  {
    'elihunter173/dirbuf.nvim',
    cmd = {'Dirbuf'},
    config = function() require('config.dirbuf') end,
  },
  -- Integration of multiple CLI file managers
  {'is0n/fm-nvim',
    config = function() require('config.fm-nvim') end,
  },
  { 'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    cond = vim.g.is_mac,
    config = function() require('config.treesitter') end,
  },
  { 'kana/vim-arpeggio',
    config = function() require('config.vim-arpeggio') end,
  },
  -- Asynchronous command execution
  { "skywind3000/asyncrun.vim",
    lazy = true,
    cmd = { "AsyncRun" },
  },
})
