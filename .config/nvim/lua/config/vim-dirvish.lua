vim.api.nvim_set_keymap("n", "<space>si<space>", "<c-w>v<c-w>H:Dirvish %<cr>30<c-w>|", {})
vim.api.nvim_set_keymap("n", "<space>so<space>", ":tab sp<cr>:Dirvish %<cr>", {})
vim.api.nvim_call_function("utils#Cabbrev", {"shdo", "Shdo"})
vim.api.nvim_call_function("utils#Cabbrev", {"dv", "Dirvish"})
vim.api.nvim_call_function("utils#Cabbrev", {"dvv", "Dirvish %"})

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_command([[
    command! -nargs=? -complete=dir Explore Dirvish <args>
    command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
    command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]])

local au=require("au")
local bkeymap = vim.api.nvim_buf_set_keymap

au.group('dirvish_config', {
    {
        'FileType',
        'dirvish',
        function()
          -- `t` to open in new tab
          bkeymap(0, "n", "t", ":call dirvish#open('tabedit', 0)<cr>", {nowait = true})
          bkeymap(0, "x", "t", ":call dirvish#open('tabedit', 0)<cr>", {nowait = true})

          bkeymap(0, "n", "q", ":bw<cr>", {nowait = true})
          bkeymap(0, "n", "<c-l>", "<cr>", {nowait = true})
          bkeymap(0, "n", "<c-h>", "-", {nowait = true})
          bkeymap(0, "n", "<c-j>", "j", {nowait = true})
          bkeymap(0, "n", "<c-k>", "k", {nowait = true})
        end,
    },
})

-- au.BufNewFile = {
--   'FileType',
--   'dirvish',
--   function()
--     print("lalala")
--     keymap("n", "q", "<c-o>", {nowait = true})
--     keymap("n", "<c-j>", "<enter>", {nowait = true})
--     keymap("n", "<c-k>", "-", {nowait = true})
--   end
-- }
