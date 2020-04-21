local KeyLayer = require('keymap-layer')
-- hop.nvim setup is deferred for 2s, have to do a lazy set here
local hop = nil
local hop_keys_backup = nil
local function ensure_hop_keys_backup()
  if hop_keys_backup == nil then
    hop = require('hop')
    if hop ~= nil then
      hop_keys_backup = hop.opts.keys
    end
  end
end
local function restore_hop_keys()
  if hop_keys_backup ~= nil then
    hop.opts.keys = hop_keys_backup
  end
end
vim.defer_fn(ensure_hop_keys_backup, 3500)

local m = {'n', 'x'} -- modes
local opt = { nowait = true }
local side_scroll = KeyLayer({
  enter = {
    {m, 'zl', '10zl'},
    {m, 'zh', '10zh'},
    {m, 'zs', 'zs'},
    {m, 'ze', 'ze'},
  },
  layer = {
    {m, 'l', '10zl', opt},
    {m, 'h', '10zh', opt},
    {m, 'L', 'zL', opt},
    {m, 'H', 'zH', opt},
    {m, 's', 'zs', opt},
    {m, 'e', 'ze', opt},
    -- scroll to center
    {m, 'm', 'zszH', opt},
  },
  exit = {
    {m, 'q', nil, opt},
    {m, '<esc>', nil, opt},
    {m, ';j', '<Cmd>HopWord<CR>', opt},
    {m, 'f', 'f', opt},
    {m, 'F', 'F', opt},
    {m, 't', 't', opt},
    {m, 'T', 'T', opt},
    {m, '`', '`', opt},
  },
  config = {
    on_enter = function()
      vim.wo.ve = "all"
      print("Enter side scroll mode")
      require("notify")("Enter side scroll mode")
    end,
    on_exit  = function()
      print("Exit side scroll mode")
      require("notify")("Exit side scroll mode")
    end,
    timeout = 30000, -- auto exit layer after ideal for 30s
    allow_nesting = false,
  }
})

local left_hand_browse = KeyLayer({
  enter = {
    {m, '<space>ddd<space>'},
  },
  layer = {
    {m, 'd', '<up>', opt},
    {m, 'f', '<down>', opt},
    {m, 's', 'b', opt},
    {m, 'g', 'w', opt},
    -- {m, 'D', [[<Cmd>lua require('neoscroll').scroll(-vim.wo.scroll , true, 20, 'cubic')<CR>]], opt},
    -- {m, 'F', [[<Cmd>lua require('neoscroll').scroll(vim.wo.scroll , true, 20, 'cubic')<CR>]], opt},
    {m, 'D', '<c-u>', opt},
    {m, 'F', '<c-d>', opt},
    {m, 'S', 'h', opt},
    {m, 'G', 'l', opt},
    {m, 'w', '0', opt},
    {m, 'r', 'g_', opt},
    -- {m, '<space>d', [[<Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 50, 'cubic')<CR>]], opt},
    -- {m, '<space>f', [[<Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 50, 'cubic')<CR>]], opt},
    {m, '<space>d', '<c-b>', opt},
    {m, '<space>f', '<c-f>', opt},
    {m, '<space>g', '40l', opt},
    {m, '<space>s', '40h', opt},
    {m, 'cs', '<c-o>', opt},
    {m, 'cg', '<c-i>', opt},
    {m, 'x', '<Cmd>HopWord<CR>', opt},
    {m, 'cx', '<Cmd>HopLine<CR>', opt},
    {m, 'ad', 'gd', opt},
    {m, 'af', 'gF', opt},
    {m, 'as', '<Plug>(openbrowser-smart-search)', opt},
    {m, 'aw', '<Cmd>Telescope lsp_document_symbols<CR>', opt},
  },
  exit = {
    {m, 'q', '<Cmd>setl noma ma?<cr>' , opt},
    {m, '<esc>', '<Cmd>setl noma ma?<cr>', opt},
  },
  config = {
    on_enter = function()
      vim.wo.siso = 500
      vim.wo.so = 500
      vim.bo.ma = false
      ensure_hop_keys_backup()
      hop.opts.keys = 'qwerasdfzxcv'
      print("Enter left hand navigation mode")
      require("notify")("Enter left hand navigation mode")
    end,
    on_exit  = function()
      restore_hop_keys()
      print("Exit left hand navigation mode")
      require("notify")("Exit left hand navigation mode")
    end,
    allow_nesting = false,
  }
})

local right_hand_browse = KeyLayer({
  enter = {
    {m, '<space>kkk<space>'},
  },
  layer = {
    {m, 'k', '<up>', opt},
    {m, 'j', '<down>', opt},
    {m, 'h', 'b', opt},
    {m, 'l', 'w', opt},
    -- {m, 'K', [[<Cmd>lua require('neoscroll').scroll(-vim.wo.scroll , true, 20, 'cubic')<CR>]], opt},
    -- {m, 'J', [[<Cmd>lua require('neoscroll').scroll(vim.wo.scroll , true, 20, 'cubic')<CR>]], opt},
    {m, 'K', '<c-u>', opt},
    {m, 'J', '<c-d>', opt},
    {m, 'H', 'h', opt},
    {m, 'L', 'l', opt},
    {m, 'u', '0', opt},
    {m, 'o', 'g_', opt},
    -- {m, '<space>k', [[<Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 50, 'cubic')<CR>]], opt},
    -- {m, '<space>j', [[<Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 50, 'cubic')<CR>]], opt},
    {m, '<space>k', '<c-b>', opt},
    {m, '<space>j', '<c-f>', opt},
    {m, '<space>l', '40l', opt},
    {m, '<space>h', '40h', opt},
    {m, ',h', '<c-o>', opt},
    {m, ',l', '<c-i>', opt},
    {m, '.', '<Cmd>HopWord<CR>', opt},
    {m, ',.', '<Cmd>HopLine<CR>', opt},
    {m, ';k', 'gd', opt},
    {m, ';j', 'gF', opt},
    {m, ';l', '<Plug>(openbrowser-smart-search)<Cmd>setl ma<cr>', opt},
    {m, ';o', '<Cmd>Telescope lsp_document_symbols<CR>', opt},
  },
  exit = {
    {m, 'p', '<Cmd>setl noma ma?<cr>' , opt},
    {m, '<esc>', '<Cmd>setl noma ma?<cr>', opt},
  },
  config = {
    on_enter = function()
      vim.wo.siso = 500
      vim.wo.so = 500
      vim.bo.ma = false
      ensure_hop_keys_backup()
      hop.opts.keys = 'yuiophjklnm;,'
      print("Enter right hand navigation mode")
      require("notify")("Enter right hand navigation mode")
    end,
    on_exit  = function()
      restore_hop_keys()
      print("Exit right hand navigation mode")
      require("notify")("Exit right hand navigation mode")
    end,
    allow_nesting = false,
  }
})

local buffer_manage = KeyLayer({
  enter = {
    {m, ';b'},
  },
  layer = {
    {m, 'h', '<Cmd>BufferLineCyclePrev<CR>',     opt},
    {m, 'l', '<Cmd>BufferLineCycleNext<CR>',     opt},
    {m, 'H', '<Cmd>BufferLineMovePrev<CR>',      opt},
    {m, 'L', '<Cmd>BufferLineMoveNext<CR>',      opt},
    {m, 'p', '<Cmd>BufferLineTogglePin<CR>',     opt},
    {m, '`', '<Cmd>BufferLineGoToBuffer -1<CR><CMD>BufferLineCycleNext<CR>',  opt},
    {m, '1', '<Cmd>BufferLineGoToBuffer 1<CR>',  opt},
    {m, '2', '<Cmd>BufferLineGoToBuffer 2<CR>',  opt},
    {m, '3', '<Cmd>BufferLineGoToBuffer 3<CR>',  opt},
    {m, '4', '<Cmd>BufferLineGoToBuffer 4<CR>',  opt},
    {m, '5', '<Cmd>BufferLineGoToBuffer 5<CR>',  opt},
    {m, '6', '<Cmd>BufferLineGoToBuffer 6<CR>',  opt},
    {m, '7', '<Cmd>BufferLineGoToBuffer 7<CR>',  opt},
    {m, '8', '<Cmd>BufferLineGoToBuffer 8<CR>',  opt},
    {m, '9', '<Cmd>BufferLineGoToBuffer 9<CR>',  opt},
    {m, '0', '<Cmd>BufferLineGoToBuffer -1<CR>', opt},
  },
  exit = {
    {m, ';b', nil , opt},
    {m, ';q', nil, opt},
    {m, 'q', nil , opt},
    {m, '<esc>', nil, opt},
    {m, 't', '<Cmd>Tree<CR>', opt},
  },
  config = {
    on_enter = function()
      print("Enter buffer management mode")
    end,
    on_exit  = function()
      hop.opts.keys = hop_keys_backup
      print("Exit buffer management mode")
    end,
    allow_nesting = false,
  }
})
