local cmd = vim.api.nvim_command

vim.fn["arpeggio#load"]()
vim.g.arpeggio_timeoutlen = 70
cmd([[Arpeggio inoremap jk  <Esc>]])
cmd([[Arpeggio xnoremap jk  <Esc>]])

