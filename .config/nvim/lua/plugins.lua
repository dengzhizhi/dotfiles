local utils = require("utils")
local fn = vim.fn

local vscode = vim.g.vscode ~= nil and true or false
local ide_level = vim.g.ide_level ~= nil and vim.g.ide_level or 0
-- 0 - nvim-cmp
-- 1 - mini.completion
-- 2 - skywind300 dict
local autocomplete_level = vim.g.autocomplete_level or math.min(ide_level, 3)

local enable_clojure = vim.g.enable_clojure and (ide_level <= 1 and 1 or 0) or 0

local enable_coc = vim.g.enable_coc ~= nil and vim.g.enable_coc or 0
local enable_lsp = (enable_coc == 0) and (vim.g.enable_lsp ~= nil and vim.g.enable_lsp or (ide_level >= 2 and 0 or 1)) or 0
print('Ide Level = ' .. ide_level)
print('Lsp support = ' .. (enable_lsp == 1 and 'nvim-lsp' or (enable_coc == 1 and 'coc' or 'no lsp')))


require("lazy").setup({
  {'dstein64/vim-startuptime', enabled = false},

  { 'stevearc/profile.nvim',
    config = function()
      -- local should_profile = os.getenv("NVIM_PROFILE")
      -- if should_profile then
      --   require("profile").instrument_autocmds()
      --   if should_profile:lower():match("^start") then
      --     require("profile").start("*")
      --   else
      --     require("profile").instrument("*")
      --   end
      -- end

      -- local function toggle_profile()
      --   local prof = require("profile")
      --   if prof.is_recording() then
      --     prof.stop()
      --     vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
      --       if filename then
      --         prof.export(filename)
      --         vim.notify(string.format("Wrote %s", filename))
      --       end
      --     end)
      --   else
      --     prof.start("*")
      --   end
      -- end
      -- vim.keymap.set("", "<f1>", toggle_profile)
    end,
  },

  {'nvim-lua/plenary.nvim'},
  {'junegunn/vim-easy-align',
    config = function() require('config.vim-easy-align') end,
    cond = ide_level <= 3,
  },
  {'tpope/vim-surround'},
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function() require('config.neo-tree') end,
    cmd={"Neotree", "NeoTreeReveal", "NeoTreeShow"},
    cond = ide_level <= 3 and not vscode,
  },

  -- View tree structure of opened buffers
  { 'el-iot/buffer-tree-explorer',
    cond = ide_level <= 2 and not vscode,
  },

  -- Git
  -- Disable it beca it creates lots of git processes and jams the cpu in monolith repo
  --  {'f-person/git-blame.nvim', config = [[require('config.git-blame')]], disable = true}

  -- Git command inside vim
  { "tpope/vim-fugitive",
    cond = ide_level <= 3 and not vscode,
  },
  -- Show git change (change, delete, add) signs in vim sign column
  -- ({"mhinz/vim-signify", event = 'BufEnter'})
  {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function() require('config.gitsigns') end,
    cond = ide_level <= 2 and not vscode,
  },
  -- DiffView
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.diffview') end,
    cond = ide_level <= 2 and not vscode,
  },

  -- Better Quickfix
  { "kevinhwang91/nvim-bqf",
    event = "FileType qf",
    config = function() require('config.bqf') end,
    cond = ide_level <= 2 and not vscode,
  },

  -- DiffView
  -- Character level diff
  {'rickhowe/diffchar.vim',
    cond = ide_level <= 1,
  },
  -- Partial diff
  {'rickhowe/spotdiff.vim',
    cmd = {
      'Diffthis',
      'Diffoff',
      'Diffupdate',
      'VDiffthis',
      'VDiffoff',
      'VDiffupdate',
    },
    cond = ide_level == 0 and not vscode,
  },
  -- Inline Edit
  {
    'AndrewRadev/inline_edit.vim',
    cmd = {'InlineEdit'},
    cond = ide_level == 0 and not vscode,
  },
  -- Integration of multiple CLI file managers
  {'is0n/fm-nvim',
    config = function() require('config.fm-nvim') end,
    cond = ide_level <= 3 and not vscode,
  },
  {
    'elihunter173/dirbuf.nvim',
    cmd = {'Dirbuf'},
    config = function() require('config.dirbuf') end,
    cond = ide_level <= 3 and not vscode,
  },

  -- Most recent d file
  {'yegappan/mru', cmd = {'MRU'},
    cond = ide_level <= 2 and not vscode,
  },

  {'machakann/vim-highlightedyank',
    cond = ide_level <= 1,
  },

  -- Welcome page
  {'mhinz/vim-startify',
    config = function() require('config.vim-startify') end,
    cond = ide_level <= 3 and not vscode,
  },

  {'inkarkat/vim-ingo-library'},

  -- tabline
  -- use {'alvarosevilla95/luatab.nvim', config = [[require('config.luatab')]]}
  {'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function() require('config.bufferline') end,
  },


  -- marks and bookmarks
  {'inkarkat/vim-mark',
    dependencies = {'vim-ingo-library'},
    config = function() require('config.vim-mark') end,
  },

  {'crusj/bookmarks.nvim',
    config = function() require('config.bookmarks') end,
    branch = 'main',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    cond = ide_level <= 2 and not vscode,
  },

  -- Switching windows with tag
  {'t9md/vim-choosewin',
    config = function() require('config.vim-choosewin') end,
    cond = not vscode,
  },
  {'simeji/winresizer',
    config = function() require('config.winresizer') end,
    cond = not vscode,
  },
  -- Animation support
  {'anuvyklack/animation.nvim', dependencies = 'anuvyklack/middleclass',
    cond = ide_level <= 1 and not vscode,
  },
  {"anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 20
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
      vim.cmd [[WindowsDisableAutowidth]]
    end,
    cond = ide_level <= 1 and not vscode,
  },

  -- {
  --   'gen740/SmoothCursor.nvim',
  --   opts = {
  --     fancy = {
  --       enable = false,
  --     },
  --   },
  -- },

  -- Quickly open terminal
  {'akinsho/toggleterm.nvim',
    config = function() require('config.toggleterm') end,
    cond = not vscode,
  },

  {'nvim-lua/popup.nvim',
    cond = not vscode,
  },
  --  {'wellle/context.vim', config = [[require('config.context')]]}

  -- Syntaxs
  -- Google Closure Template (soy)
  {'duganchen/vim-soy', ft = {'soy'}},
  -- splunk spl
  { dir = '~/dev/zhizhi/github/vim-spl', ft = {'spl'}},
  -- Allow ansi colors in vim
  {'powerman/vim-plugin-AnsiEsc', cmd={'AnsiEsc'},
    cond = ide_level == 0 and not vscode,
  },

  -- CSV
  {'mechatroner/rainbow_csv',
    ft={'csv'},
    init = function()
      vim.g.disable_rainbow_key_mappings = 1
      vim.g.rbql_with_headers = 1
      vim.g.rbql_backend_language = 'js'
    end,
    cond = ide_level == 0 and not vscode,
  },

  -- Clojure
  {'guns/vim-sexp',
    ft = { 'clj', 'cljs', 'clojure' },
    config = function() require('config/vim-sexp') end,
    cond = enable_clojure ~= 0,
  },
  {'tpope/vim-sexp-mappings-for-regular-people',
    dependencies = { 'vim-sexp' },
    ft = { 'clj', 'cljs', 'clojure' },
    cond = enable_clojure ~= 0,
  },
  {'Olical/conjure',
    config = function() require('config.conjure') end,
    cond = enable_clojure ~= 0,
  },

  -- auto complete (change complete_method to pick one)
  {"hrsh7th/nvim-cmp",
    config = function() require('config.nvim-cmp') end,
    dependencies = { 'L3MON4D3/LuaSnip' },
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  -- nvim-cmp completion sources
  {"saadparwaiz1/cmp_luasnip",
    dependencies = { "nvim-cmp" },
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  {"hrsh7th/cmp-nvim-lsp",
    dependencies = { "nvim-cmp" },
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  {"hrsh7th/cmp-buffer",
    dependencies = { "nvim-cmp" },
    config = function() require('config.cmp-buffer') end,
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  {"hrsh7th/cmp-path",
    dependencies = { "nvim-cmp" },
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  {"hrsh7th/cmp-nvim-lua",
    dependencies = { "nvim-cmp" },
    cond = autocomplete_level == 0 and enable_lsp == 1 and not vscode,
  },
  -- {"hrsh7th/cmp-nvim-lsp-signature-help",
  --   dependencies = { "nvim-cmp" },
  --   cond = autocomplete_level == 0,
  -- },

  {
    'echasnovski/mini.completion',
    config = function()
      require('mini.completion').setup()
    end,
    cond = autocomplete_level == 1 and not vscode,
  },

  {
    'skywind3000/vim-auto-popmenu',
    init = function()
      vim.g.apc_enable_ft = {text = 1, markdown = 1, php = 1, python = 1, zsh = 1 }
      vim.o.cpt = '.,k,w,b'
      vim.o.completeopt = 'menu,menuone,noselect'
      vim.o.shortmess = vim.o.shortmess .. 'c'
    end,
    cond = autocomplete_level == 2 and not vscode,
  },

  { 'skywind3000/vim-dict',
    init = function()
      vim.g.vim_dict_dict = {
        '~/.config/nvim/dict',
      }
    end,
    cond = autocomplete_level == 2 and not vscode,
  },

  { 'williamboman/mason.nvim',
    config = true,
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },

  { 'williamboman/mason-lspconfig.nvim',
    config = true,
    dependencies = {'mason.nvim'},
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },

  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  { 'neovim/nvim-lspconfig',
    config = function() require('config.lsp') end,
    dependencies = {'mason-lspconfig.nvim'},
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },

  {'tami5/lspsaga.nvim', branch = 'main',
    config = function() require('config.lspsaga') end,
    dependencies = { 'nvim-lspconfig' },
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('config.null-ls') end,
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },

  -- coc
  {'neoclide/coc.nvim',
    cond = ide_level <= 1 and enable_coc == 1 and not vscode,
    branch = 'release',
    init = function()
      vim.g.coc_global_extensions = {
        'coc-json',
        -- 'coc-git',
        'coc-css',
        'coc-cssmodules',
        'coc-diagnostic',
        -- 'coc-ecdict',
        'coc-emmet',
        'coc-eslint',
        'coc-highlight',
        'coc-html',
        'coc-htmldjango',
        'coc-jedi',
        -- 'coc-pylsp',
        'coc-prettier',
        'coc-vimlsp',
        'coc-sumneko-lua',
      }
    end,
    config = function() require('config.coc') end,
  },

  -- Plantuml
  {'aklt/plantuml-syntax', ft={'pu', 'uml', 'puml', 'plantuml'}},
  {'weirongxu/plantuml-previewer.vim',
    dependencies = {'open-browser.vim', 'plantuml-syntax'},
    cmd={'PlantumlOpen', 'PlantumlStart', 'PlantumlStop', 'Plantumlave'},
    cond = ide_level <= 2,
  },

  -- Show lsp progress
  {
    'j-hui/fidget.nvim',
    config=true,
    cond = ide_level <= 2 and not vscode,
  },

  -- Pretty diagnostics list
  {
    'folke/trouble.nvim',
    cmd = {'Trouble', 'TroubleToggle'},
    config = true,
    cond = ide_level <= 1 and enable_lsp == 1 and not vscode,
  },
  { 'rktjmp/lush.nvim',
    cond = ide_level <= 3 and not vscode,
  },

  { 'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    cond = ide_level <= 2 and vim.g.is_mac,
    config = function() require('config.treesitter') end,
  },
  { 'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter',
    cond = vim.g.is_mac and ide_level <= 2 and not vscode,
  },
  { 'nvim-orgmode/orgmode',
    dependencies = 'nvim-treesitter',
    cond = vim.g.is_mac and ide_level <= 1 and not vscode,
    config = function() require('config.orgmode') end,
  },
  -- refractor code with TS
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    dependencies = 'nvim-treesitter',
    cond = vim.g.is_mac and ide_level <= 2 and not vscode,
  },
  -- select code
  {
    'RRethy/nvim-treesitter-textsubjects',
    dependencies = 'nvim-treesitter',
    cond = vim.g.is_mac and ide_level <= 2,
  },
  -- explore syntax tree and test TS queries
  --  {
  --   'nvim-treesitter/playground',
  --   dependencies = 'nvim-treesitter',
  --   cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
  -- }
  -- hints for operators
  {
    'mfussenegger/nvim-ts-hint-textobject',
    dependencies = 'nvim-treesitter',
    cond = vim.g.is_mac and ide_level <= 2,
  },

  -- treesj is quite slow on startup, make sure it is lazy loaded
  -- vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/treesj_keymaps.vim')
  -- {
  --   'Wansmer/treesj',
  --   dependencies = { 'nvim-treesitter' },
  --   config = [[require('config.treesj')]],
  --   cmd = {'TSJToggle'},
  -- }

  {
    'drybalka/tree-climber.nvim',
    dependencies = { 'nvim-treesitter' },
    config = function() require('config.treeclimber2') end,
    cond = vim.g.is_mac and ide_level <= 2,
  },


  --  {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   requires = { 'nvim-treesitter/nvim-treesitter' },
  --   dependencies = { 'nvim-treesitter' },
  --   config = [[require('config.treesitter-textobjects')]],
  -- }

  -- Symbols outline
  {
    'simrat39/symbols-outline.nvim',
    cmd = {'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose'},
    cond = vim.g.is_mac and ide_level <= 2 and not vscode,
    config = true,
  },

  -- swap delimited items
  {'machakann/vim-swap',
    event = 'VimEnter',
    cond = ide_level <= 1,
  },

  -- IDE for Lisp
  --  'kovisoft/slimv'
  -- { 'vlime/vlime',
  --   ft = { 'lisp' },
  --   cond = utils.executable('sbcl'),
  --   config = function(plugin)
  --     vim.oenable_clojurept.rtp:append(plugin.dir .. "/vim")
  --   end,
  -- },

  -- Super fast buffer jump (replacing easy-motion)
  {
    'phaazon/hop.nvim',
    event = 'VimEnter',
    config = function()
      vim.defer_fn(function() require('config.nvim_hop') end, 2000)
    end,
    cond = ide_level <= 3,
  },

  -- Minimap
  --  {'wfxr/minimap.vim', cmd={'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh', 'MinimapUpdateHighlight'}}
  {
    'echasnovski/mini.map',
    config = function() require('config.mini-map') end,
    cond = ide_level <= 4 and not vscode,
  },

  -- Quick calculator buffer
  {
    'fedorenchik/VimCalc3',
    cmd = { 'Calc'},
    config = function() require('config.vim-calc') end,
    cond = not vscode,
  },

  -- Show match number and index for searching
  {
    'kevinhwang91/nvim-hlslens',
    branch = 'main',
    config = function() require('config.hlslens') end,
    cond = ide_level <= 2 and not vscode,
  },

  -- Stay after pressing * and search selected text
  {
    'haya14busa/vim-asterisk',
    event = 'VimEnter',
    config = function() require('config.vim-asterisk') end,
    cond = ide_level <= 2,
  },

  -- File search, tag search and more
  { 'Yggdroot/LeaderF',
    build = function()
      if not vim.g.is_win then
        vim.cmd [[LeaderfInstallCExtension]]
      end
    end,
    cond = ide_level <= 4 and not vscode,
  },

  -- A faster fuzzy search using fzy
  -- {
  --   'vigoux/azy.nvim',
  --   build = 'make lib',
  --   config = function() require('config.azy') end,
  -- },

  -- Search panel for in-place replacement across files
  -- It is slow on start up, making it lazy
  {
    'dyng/ctrlsf.vim',
    config = function() require('config.ctrlsf') end,
    cond = ide_level <= 2 and not vscode,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      -- {'benfowler/telescope-luasnip.nvim', lazy = true, module = 'telescope._extensions.luasnip'},
    },
    config = function()
      require('config.telescope')
    end,
    cond = ide_level <= 2 and not vscode,
  },

  -- search emoji and other symbols
  {
    'nvim-telescope/telescope-symbols.nvim',
    dependencies = 'telescope.nvim',
    config = function() require('config.telescope-symbols') end,
    cond = ide_level <= 2 and not vscode,
  },

  {
    'LinArcX/telescope-command-palette.nvim',
    dependencies = 'telescope.nvim',
    config = function() require('config.telescope-command-palette') end,
    cond = ide_level <= 2 and not vscode,
  },

  { 'kkharji/sqlite.lua' },

  -- Choose chrome bookmarks with telescope
  {
    'dhruvmanila/telescope-bookmarks.nvim',
    dependencies = { 'telescope.nvim', 'kkharji/sqlite.lua' },
    version = '*',
    config = function() require('config.telescope-bookmarks') end,
    cond = ide_level <= 2 and not vscode,
  },

  {
    'danielfalk/smart-open.nvim',
    dependencies = { 'telescope.nvim', 'kkharji/sqlite.lua'},
    config = function()
      require'telescope'.load_extension('smart_open')
    end,
    cond = ide_level <= 2 and not vscode,
  },

  -- bookmarking

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'telescope.nvim' },
    config = function() require('config.harpoon') end,
    cond = ide_level <= 3 and not vscode,
  },

  {
    'EthanJWright/vs-tasks.nvim',
    dependencies = { 'telescope.nvim' },
    config = function() require('config.vs-task') end,
    cond = ide_level <= 4 and not vscode,
  },

  -- A list of colorscheme plugin you may want to try. Find what suits you.
  {'lifepillar/vim-gruvbox8'},
  {'navarasu/onedark.nvim'},
  {'sainnhe/edge'},
  {'sainnhe/sonokai'},
  {'sainnhe/gruvbox-material',
    -- config = function()
    --   vim.cmd [[colorscheme gruvbox-material]]
    -- end
  },
  {'shaunsingh/nord.nvim'},
  {'sainnhe/everforest'},
  {'EdenEast/nightfox.nvim'},
  {'rebelot/kanagawa.nvim'},
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        --  the night style
        style = 'storm',
        sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
        on_colors = function(colors)
          colors.border = '#565f89'
          colors.error = '#ff0000'
        end
      })
    end,
  },
  {
    'NTBBloodbath/doom-one.nvim',
    init = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = false
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable italic comments
      vim.g.doom_one_italic_comments = false
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false
      -- Enable transparent background
      vim.g.doom_one_transparent_background = false

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = false
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = false
      vim.g.doom_one_plugin_nvim_tree = false
      vim.g.doom_one_plugin_dashboard = false
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = false
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = false
      vim.g.doom_one_plugin_lspsaga = true
    end,
    config = function()
      vim.cmd('colorscheme doom-one')
    end,
  },
  {'uloco/bluloco.nvim'},
  {'catppuccin/nvim', name = 'catppuccin'},

  {'kyazdani42/nvim-web-devicons', event = 'VimEnter'},

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function() require('config.statusline') end,
    cond = not vscode,
  },
  --  {'itchyny/lightline.vim'}

  -- Add indent indicator to blanklines using virtual text
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = function() require('config.indent-blankline') end,
    cond = ide_level <= 4,
  },

  -- automatically adjusts 'shiftwidth' and 'expandtab' heuristically
  {'tpope/vim-sleuth',
    cond = ide_level <= 3,
  },

  -- Highlight URLs inside vim
  {'itchyny/vim-highlighturl', event = 'VimEnter',
    cond = ide_level <= 2,
  },

  -- notification plugin
  {
    'rcarriga/nvim-notify',
    event = 'BufEnter',
    config = function()
      vim.defer_fn(function() require('config.nvim-notify') end, 2000)
    end,
    cond = not vscode,
  },

  -- For Windows and Mac, we can open an URL in the browser. For Linux, it may
  -- not be possible since we maybe in a server which disables GUI.
  -- open URL in browser
  {'tyru/open-browser.vim',
    cond = vim.g.is_win or vim.g.is_mac,
    event = 'VimEnter',
  },
  -- search in browser
  {'dengzhizhi/vim-browser-search',
    cond = vim.g.is_win or vim.g.is_mac,
    config=function() require('config.vim-browser-search') end,
    event = 'VimEnter',
    init = function()
      vim.g.browser_search_builtin_engines = {
        google = 'https://google.com/search?q="%s"',
        obsidian ='obsidian://search?vault=obsidian&query=%s',
        -- clojuredocs ='https://clojuredocs.org/search?q=%s',
        -- wikipedia = 'https://en.wikipedia.org/wiki/%s',
        -- stackoverflow = 'https://stackoverflow.com/search?q="%s"',
      }
    end,
  },
  -- search in Dash
  {
    'mrjones2014/dash.nvim',
    cond = ide_level <= 1 and (vim.g.is_win or vim.g.is_mac),
    build = 'make install',
    config = function()
      require('config.dash')
    end,
  },

  -- Snippet engine and snippet template
  -- use({'SirVer/ultisnips', event = 'InsertEnter', config = [[require('config.ultisnips')]]})
  -- use({ 'dengzhizhi/vim-snippets', after = 'ultisnips'})
  {'L3MON4D3/LuaSnip',
    cond = ide_level <= 3 or not vscode,
    event = 'InsertEnter',
    dependencies = {'rafamadriz/friendly-snippets'},
    config = function() require('config.luasnip') end,
  },

  {'rafamadriz/friendly-snippets',
    cond = ide_level <= 3 or not vscode,
    dependencies = { 'LuaSnip' },
    config = function() require('config.friendly-snippets') end,
  },

  -- Automatic insertion and deletion of a pair of characters
  -- use({'Raimondi/delimitMate', event = 'InsertEnter'})
  -- use({'windwp/nvim-autopairs', event = 'InsertEnter', config = [[require('config.nvim-autopairs')]]})
  {'hrsh7th/nvim-insx',
    config = function() require('config.nvim-insx') end,
    cond = ide_level <= 1 and not vscode,
  },

  -- Comment plugin
  {'tpope/vim-commentary',
    event = 'VimEnter',
    cond = ide_level <= 1,
  },

  -- Show undo history visually
  {'simnalamburt/vim-mundo',
    cmd = {'MundoToggle', 'MundoShow'},
    cond = ide_level <= 3 and not vscode,
  },

  -- Repeat vim motions
  {'tpope/vim-repeat',
    event = 'VimEnter',
    cond = ide_level <= 3,
  },

  -- simultaneous keymapping
  { 'kana/vim-arpeggio',
    config = function() require('config.vim-arpeggio') end,
    cond = ide_level <= 4 and not vscode,
  },

  -- keymap layer
  -- ({
  --   '~/dev/zhizhi/github/keymap-layer.nvim',
  --   config = [[require('config.keymap-layer')]],
  -- })
  {
    'anuvyklack/hydra.nvim',
    config = function() require('config.hydra') end,
    cond = ide_level <= 2,
  },

  -- Auto format tools
  { 'sbdchd/neoformat', cmd = { 'Neoformat' } },

  -- Another markdown plugin
  { 'plasticboy/vim-markdown',
    init = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.mw_no_mappings = 1
    end,
    ft = { 'markdown' },
    dependencies = { 'godlygeek/tabular' },
    cond = ide_level <= 3 and not vscode,
  },

  -- Faster footnote generation
  { 'vim-pandoc/vim-markdownfootnotes',
    ft = { 'markdown' },
    cond = ide_level <= 3 and not vscode,
  },

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  { 'godlygeek/tabular',
    cmd = { 'Tabularize' },
    cond = ide_level <= 3 and not vscode,
  },

  -- Markdown JSON header highlight plugin
  { "elzr/vim-json",
    ft = { "json" },
    config = function() require("config.vim-json") end,
    cond = ide_level <= 3 and not vscode,
  },

  {
    "iamcco/markdown-preview.nvim",
    cond = ide_level <= 3 and (vim.g.is_win or vim.g.is_mac) and not vscode,
    build = function()
      fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },

  -- Preview in Glow
  {
    "ellisonleao/glow.nvim",
    cmd = { "Glow" },
    config = function()
      require('glow').setup({
        pager = true,
        width = 120,
        width_ratio = 0.5,
        height_ratio = 0.9,
      })
    end,
    cond = ide_level <= 2 and not vscode,
  },

  {'chrisbra/unicode.vim', event = 'VimEnter',
    cond = ide_level <= 2,
  },

  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  {'wellle/targets.vim',
    event = 'VimEnter',
    cond = ide_level <= 3,
  },

  { 'kana/vim-textobj-user',
    cond = ide_level <= 3,
  },

  {'Julian/vim-textobj-variable-segment',
    event = 'VimEnter',
    dependencies = { 'vim-textobj-user' },
    cond = ide_level <= 3,
  },

  -- Only use these plugin on Windows and Mac and when LaTeX is installed
  { 'lervag/vimtex',
    cond = ide_level == 0 and (vim.g.is_win or vim.g.is_mac) and utils.executable('latex') and not vscode,
    ft = { 'tex' },
  },

  {'preservim/vimux',
    cond = ide_level <= 1 and utils.executable('tmux') and not vscode,
    config=function() require('config.vimux') end,
  },

  -- Modern matchit implementation
  {'andymass/vim-matchup',
    event = "VimEnter",
    config=function() require('config.vim-matchup') end,
    cond = ide_level <= 2,
  },

  {"tpope/vim-scriptease",
    cmd = {"Scriptnames", "Message", "Verbose"}
  },

  -- Asynchronous command execution
  { "skywind3000/asyncrun.vim",
    lazy = true,
    cmd = { "AsyncRun" },
    cond = ide_level <= 4,
  },

  { "cespare/vim-toml",
    ft = { "toml" },
    branch = "main" },

  {"ojroques/vim-oscyank",
    cond = vim.g.is_linux,
    cmd = {'OSCYank', 'OSCYankReg'}},

  -- show and trim trailing whitespaces
  {'jdhao/whitespace.nvim', event = 'VimEnter',
    cond = ide_level <= 3,
  },

  -- Ascii arts
  -- {'vim-scripts/DrawIt', event = 'VimEnter', cmd = {
  --   'DrawIt',
  --   'DIstart',
  --   'DInrml',
  --   'DIsngl',
  --   'DIdbl'}
  -- },

  {'jbyuki/venn.nvim', cmd = {'VBox'} },

  -- Chinese input (Disabled because it makes group norm command very slow)
  -- { 'rlue/vim-barbaric' },

  -- Terraform filetype
  { 'hashivim/vim-terraform', ft={"terraform"} },

  -- Disable time consuming features for large files
  {
    "lunarvim/bigfile.nvim",
    config = function()
      pcall(function()
        require("bigfile").config({
          filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
          pattern = { "*" }, -- autocmd pattern
          features = { -- features to disable
            "lsp",
            "treesitter",
            "syntax",
            "vimopts",
            "filetype",
          },
        })
      end)
    end,
    cond = not vscode,
  },
})
