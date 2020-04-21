local neogit = require('neogit')

neogit.setup {}

vim.api.nvim_call_function('utils#Cabbrev', {"ng", "Neogit"})
