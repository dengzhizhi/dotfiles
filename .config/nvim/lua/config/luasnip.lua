local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
    return nil
end

local ls = prequire "luasnip"
local types = prequire "luasnip.util.types"
-- local cmp = prequire("cmp")

ls.config.set_config {
  -- Remember to keep around the last snippet.
  -- You can jump back to it even if you moved outside of the selection
  history = true,

  -- Update dynamic snippets as you type
  updateevents = "TextChanged, TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " ", "Error"} },
      }
    }
  },
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if ls and ls.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    end
    return ""
end
_G.s_tab_complete = function()
    if ls and ls.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end
vim.api.nvim_set_keymap("i", ",l", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", ",l", "v:lua.tab_complete()", {expr = true})

vim.api.nvim_set_keymap("n", ",S", "<cmd>source ~/.config/nvim/my_snippets/luasnip.lua<CR>", { silent = true })
vim.api.nvim_command [[source ~/.config/nvim/my_snippets/luasnip.lua]]
