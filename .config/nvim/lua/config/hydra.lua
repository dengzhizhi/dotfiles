local Hydra = require('hydra')

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

local opt = { nowait = true, silent = true }
local xopt = { mode = { 'x' }, nowait = true, silent = true  }

Hydra({
   name = 'Side scroll',
   mode = 'n',
   body = 'z',
   config = {
      timeout = 30000,
      on_enter = function()
         require('lualine').refresh()
      end,
      on_exit = function()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'h', '10zh' },
      { 'l', '10zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL', { desc = 'half screen ←/→' } },
      { 's', 'zs' },
      { 'e', 'ze', { desc = 'start & end s/e' } },

      { 'q', nil, { exit = true, nowait = true } },
      { 'esc', nil, { exit = true, nowait = true, desc = "exit" } },
   },
})

local manage_buffer_head_hint = [[
 _h_: Next buffer      _H_: Move left     _p_: Toggle pin
 _l_: Prev buffer      _L_: Move right    ^ ^
 _`_: Jump to begin    _0_: Jump to last  _t_: Buffer tree
 _1_ _2_ _3_ _4_ _5_ _6_ _7_ _8_ _9_: Select by number
 ^
 Window selection     Tab selection
      _d_                 _u_     _o_
 _s_     _g_
      _f_
]]

Hydra({
   name = 'Manage Buffer',
   mode = 'n',
   body = ';b',
   hint = manage_buffer_head_hint,
   config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = {
         type = 'window',
         position = 'bottom-right',
         border = 'rounded',
      },
      on_enter = function()
         require('lualine').refresh()
      end,
      on_exit = function()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'h', '<Cmd>BufferLineCyclePrev<CR>',     opt},
      { 'l', '<Cmd>BufferLineCycleNext<CR>',     opt},
      { 'H', '<Cmd>BufferLineMovePrev<CR>',      opt},
      { 'L', '<Cmd>BufferLineMoveNext<CR>',      opt},
      { 'p', '<Cmd>BufferLineTogglePin<CR>',     opt},
      { '`', '<Cmd>BufferLineGoToBuffer -1<CR><CMD>BufferLineCycleNext<CR>',  opt},
      { '1', '<Cmd>BufferLineGoToBuffer 1<CR>',  opt},
      { '2', '<Cmd>BufferLineGoToBuffer 2<CR>',  opt},
      { '3', '<Cmd>BufferLineGoToBuffer 3<CR>',  opt},
      { '4', '<Cmd>BufferLineGoToBuffer 4<CR>',  opt},
      { '5', '<Cmd>BufferLineGoToBuffer 5<CR>',  opt},
      { '6', '<Cmd>BufferLineGoToBuffer 6<CR>',  opt},
      { '7', '<Cmd>BufferLineGoToBuffer 7<CR>',  opt},
      { '8', '<Cmd>BufferLineGoToBuffer 8<CR>',  opt},
      { '9', '<Cmd>BufferLineGoToBuffer 9<CR>',  opt},
      { '0', '<Cmd>BufferLineGoToBuffer -1<CR>', opt},

      { 'o', 'gt', opt},
      { 'u', 'gT', opt},

      { 's', '<Cmd>wincmd h<CR>', opt},
      { 'g', '<Cmd>wincmd l<CR>', opt},
      { 'd', '<Cmd>wincmd k<CR>', opt},
      { 'f', '<Cmd>wincmd j<CR>', opt},

      { 't', '<Cmd>Tree<CR>', {exit = true, nowait = true}},

      { '<esc>', nil, {exit = true, nowait = true}},
      { 'q',     nil, {exit = true, nowait = true}},
      { '<cr>',  nil, {exit = true, nowait = true, desc = "quit"}},
   },
})

-- local left_hand_hint = [[
--        _d_          hp _D_                 p _<space>d_
--  _s_ w  w _g_   _S_ c  c _G_    _<space>s_ 40  40 _<space>g_
--        _f_          hp _F_                 p _<space>f_
--  ^
--  _w_:  line start   _r_:  line end   _cs_: back              _cg_: forward
--  _x_:  Hop word     _cx_: Hop line   _ad_: Goto Definition   _af_: Goto File
--  _as_: Open link    _aw_:  Document symbols  _W_: Prev Buf   _R_: Next Buf
-- ]]

Hydra({
   name = 'Left Hand',
   mode = 'n',
   body = '<space>ddd<space>',
   -- hint = left_hand_hint,
   config = {
      color = 'pink',
      -- hint = {
      --    type = 'window',
      --    position = 'bottom-right',
      --    border = 'rounded',
      -- },
      invoke_on_body = true,
      on_enter = function()
         vim.wo.siso = 500
         vim.wo.so = 500
         vim.bo.ma = false
         ensure_hop_keys_backup()
         hop.opts.keys = 'qwerasdfzxcv'
         require('lualine').refresh()
      end,
      on_exit = function()
         restore_hop_keys()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'd', '<up>',   opt},
      { 'f', '<down>', opt},
      { 's', 'b',      opt},
      { 'g', 'w',      opt},

      { 'D', '<c-u>', opt},
      { 'F', '<c-d>', opt},
      { 'S', 'h',     opt},
      { 'G', 'l',     opt},
      { 'w', '0',     opt},
      { 'r', 'g_',    opt},

      { '<space>d', '<c-b>',                                   opt},
      { '<space>f', '<c-f>',                                   opt},
      { '<space>g', '40l',                                     opt},
      { '<space>s', '40h',                                     opt},
      { 'cs',       '<c-o>',                                   opt},
      { 'cg',       '<c-i>',                                   opt},
      { 'x',        '<Cmd>HopWord<CR>',                        opt},
      { 'cx',       '<Cmd>HopLine<CR>',                        opt},
      { 'ad',       'gd',                                      opt},
      { 'af',       'gF',                                      opt},
      { 'as',       '<Plug>(openbrowser-smart-search)',        opt},
      { 'aw',       '<Cmd>Telescope lsp_document_symbols<CR>', opt},
      { 'W',        '<Cmd>BufferLineCyclePrev<CR>',            opt},
      { 'R',        '<Cmd>BufferLineCycleNext<CR>',            opt},

      { 'q',     '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true}},
      { '<esc>', '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true}},
      { '<cr>',  '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true, desc = 'quit and lock'}},
   },
})

-- local right_hand_hint = [[
--        _k_          hp _K_                p _<space>k_
--  _h_ w  w _l_   _H_ c  c _L_    _<space>h_ 40  40 _<space>l_
--        _j_          hp _J_                p _<space>j_
--  ^
--  _u_:  line start   _o_:  line end   _,h_: back              _,l_: forward
--  _._:  Hop word     _,._: Hop line   _;k_: Goto Definition   _;j_: Goto File
--  _;l_: Open link    _;o_:  Document symbols  _U_: Prev Buf   _O_:  Next Buf
-- ]]

Hydra({
   name = 'Right Hand',
   mode = 'n',
   body = '<space>kkk<space>',
   -- hint = right_hand_hint,
   config = {
      color = 'pink',
      -- hint = {
      --    type = 'window',
      --    position = 'bottom-right',
      --    border = 'rounded',
      -- },
      invoke_on_body = true,
      on_enter = function()
         vim.wo.siso = 500
         vim.wo.so = 500
         vim.bo.ma = false
         ensure_hop_keys_backup()
         hop.opts.keys = 'yuiophjklnm;,'
         require('lualine').refresh()
      end,
      on_exit = function()
         restore_hop_keys()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'k', '<up>',   opt},
      { 'j', '<down>', opt},
      { 'h', 'b',      opt},
      { 'l', 'w',      opt},

      { 'K', '<c-u>', opt},
      { 'J', '<c-d>', opt},
      { 'H', 'h',     opt},
      { 'L', 'l',     opt},
      { 'u', '0',     opt},
      { 'o', 'g_',    opt},

      { '<space>k', '<c-b>',                                   opt},
      { '<space>j', '<c-f>',                                   opt},
      { '<space>h', '40h',                                     opt},
      { '<space>l', '40l',                                     opt},
      { ',h',       '<c-o>',                                   opt},
      { ',l',       '<c-i>',                                   opt},
      { '.',        '<Cmd>HopWord<CR>',                        opt},
      { ',.',       '<Cmd>HopLine<CR>',                        opt},
      { ';k',       'gd',                                      opt},
      { ';j',       'gF',                                      opt},
      { ';l',       '<Plug>(openbrowser-smart-search)',        opt},
      { ';o',       '<Cmd>Telescope lsp_document_symbols<CR>', opt},
      { 'U',        '<Cmd>BufferLineCyclePrev<CR>',            opt},
      { 'O',        '<Cmd>BufferLineCycleNext<CR>',            opt},

      { 'p',     '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true}},
      { '<esc>', '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true}},
      { '<cr>',  '<Cmd>setl noma ma?<cr>', {exit = true, nowait = true, exit_before = true, desc = 'quit and lock'}},
   },
})


local venn_head_hint = [[
 Draw lines   _<space>b_ Draw Box
      _K_      _<space>v_ Block Visual
 _H_     _L_    _<space>o_ Add 100 lines
      _J_      _;k_       Hop
]]

Hydra({
   name = 'Venn',
   mode = 'n',
   body = '<space>dd<space>',
   hint = venn_head_hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         type = 'window',
         position = 'bottom-right',
         border = 'rounded',
      },
      on_enter = function()
         vim.wo.ve = 'all'
         vim.wo.cuc = true
         vim.cmd[[IndentBlanklineDisable]]
         require('lualine').refresh()
      end,
      on_exit = function()
         vim.cmd[[IndentBlanklineEnable]]
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'H',        '<C-V>h:VBox<CR>',    opt},
      { 'L',        '<C-V>l:VBox<CR>',    opt},
      { 'J',        '<C-V>j:VBox<CR>',    opt},
      { 'K',        '<C-V>k:VBox<CR>',    opt},
      { '<space>b', ':VBox<CR>',          xopt},
      { '<space>v', '<C-V>',              opt},
      { '<space>o', '<ESC>mz100o<ESC>`z', opt},
      { ';k',
         '<cmd>lua require("hop").hint_patterns({}, ".....")<cr>',
         {
            mode = {'o', 'n', 'x'},
            silent = true,
            nowait = true
         }
      },
      { '<esc>', nil, {exit = true, nowait = true}},
      { 'q',     nil, {exit = true, nowait = true}},
      { '<cr>',  nil, {exit = true, nowait = true, desc = "quit"}},
   },
})

Hydra({
   name = 'NoNeckPain',
   mode = 'n',
   body = '<space>np<space>',
   config = {
      color = 'amaranth',
      invoke_on_body = true,
      on_enter = function()
         require('no-neck-pain').enable()
         require('lualine').refresh()
      end,
      on_exit = function()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'n', '<cmd>NoNeckPain<cr>',          {desc = "Toggle"}},
      { 'j', '<cmd>NoNeckPainWidthDown<cr>', {desc = "Shrink"}},
      { 'k', '<cmd>NoNeckPainWidthUp<cr>',   {desc = "Expend"}},
      { '1', '<cmd>NoNeckPainResize 40<cr>'},
      { '2', '<cmd>NoNeckPainResize 80<cr>'},
      { '3', '<cmd>NoNeckPainResize 120<cr>'},
      { '4', '<cmd>NoNeckPainResize 160<cr>'},
      { '5', '<cmd>NoNeckPainResize 200<cr>'},
      { '6', '<cmd>NoNeckPainResize 240<cr>'},
      { '7', '<cmd>NoNeckPainResize 280<cr>', {desc = 'Preset width'}},
      { '<esc>', nil, {exit = true, nowait = true}},
      { '<cr>',  nil, {exit = true, nowait = true, desc = "quit"}},
   },
})

Hydra({
   name = 'Highlight',
   mode = 'n',
   body = '<space>fdh<space>',
   config = {
      color = 'pink',
      invoke_on_body = true,
      on_enter = function()
         require('lualine').refresh()
      end,
      on_exit = function()
         require('lualine').refresh()
      end,
   },
   heads = {
      { 'J', '<cmd>Hi><cr>' },
      { 'K', '<cmd>Hi<<cr>', {desc = "< > Keyword"}},
      { 'n', '<cmd>Hi}<cr>' },
      { 'N', '<cmd>Hi{<cr>', {desc = "< > Highlight"}},
      { '=', '<cmd>Hi==<cr>', {desc = "All windows"}},
      { '-', '<cmd>Hi=<cr>', {desc = "Single windows"}},
      { '<esc>', nil, {exit = true, nowait = true}},
      { 'q', nil, {exit = true, nowait = true}},
      { '<cr>',  nil, {exit = true, nowait = true, desc = "quit"}},
   },
})
