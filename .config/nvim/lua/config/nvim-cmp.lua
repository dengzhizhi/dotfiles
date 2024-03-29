-- Setup nvim-cmp.
local u = require('utils')
local cmp_ok, cmp = pcall(require, 'cmp')

local luasnip_ok, luasnip = pcall(require, 'luasnip')
local compare = require("cmp.config.compare")

vim.api.nvim_command('hi LuasnipChoiceNodePassive cterm=italic')
-- vim.cmd("hi link CmpItemMenu Comment")
vim.opt.completeopt = 'menu,menuone,noselect'

if not cmp_ok then
  u.notif('Plugins :', 'Something went wrong with nvim-cmp', vim.log.levels.WARN)
  return
end

if not luasnip_ok then
  u.notif('Plugins :', 'Something went wrong with luasnip', vim.log.levels.WARN)
  return
end

local check_backspace = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local icons = {
    Array = ' ',
    Boolean = ' ',
    Class = ' ',
    Color = ' ',
    Constant = ' ',
    Constructor = ' ',
    Enum = ' ',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = ' ',
    Interface = ' ',
    Key = ' ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Namespace = ' ',
    Null = 'ﳠ ',
    Number = ' ',
    Object = ' ',
    Operator = ' ',
    Package = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = ' ',
    String = ' ',
    Struct = ' ',
    Text = ' ',
    TypeParameter = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = ' ',
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, item)
      item.kind = string.format('%s', icons[item.kind])
      item.menu = ({
        buffer = '[Buffer]',
        luasnip = '[Snip]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[API]',
        path = '[Path]',
      })[entry.source.name]
      return item
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space><C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
        'i',
        's',
      }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
      elseif require('lua').jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
        'i',
        's',
      }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 100 },
    { name = 'buffer', priority = 1 },
    -- { name = 'rg', priority = 3 },
    { name = 'luasnip', priority = 3 },
    { name = 'path', priority = 2 },
    -- { name = 'nvim_lsp_signature_help', priority = 10 },
    { name = 'nvim_lua', priority = 4 },
  }),
  completion = {
    keyword_length = 1,
    -- completeopt = "menu,noselect",
    -- Invoke popup manually
    autocomplete = false,
  },
  -- sorting = {
  --   priority_weight = 5,
  --   comparators = {
  --     compare.offset,
  --     compare.exact,
  --     compare.score,
  --     compare.recently_used,
  --     compare.locality,
  --     compare.sort_text,
  --     compare.length,
  --     compare.order,
  --   }
  -- },
  experimental = {
    ghost_text = false
  },
})

