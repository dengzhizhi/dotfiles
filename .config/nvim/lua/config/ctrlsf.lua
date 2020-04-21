-- I borrow the visual text extraction function from Leaderf here so this keymap need Leaderf in place
vim.keymap.set("n", "<space>fej<space>", [[:CtrlSF<cr>]], {silent = true})
vim.keymap.set("x", "<space>fej<space>", [[:<c-u><c-r>=printf("CtrlSF -S %s", leaderf#Rg#visual())<cr><cr>]], {silent = true})
vim.keymap.set("n", "<space>fek<space>", [[:CtrlSF -R ""<left>]], {})
vim.keymap.set("x", "<space>fek<space>", [[:<c-u><c-r>=printf("CtrlSF %s", leaderf#Rg#visual())<cr><left><c-f>0f"l]], {})
vim.keymap.set("n", "<space>fejk<space>", [[:CtrlSFOpen<cr>]], {})
vim.keymap.set("n", "<space>fekj<space>", [[:CtrlSFOpen<cr>]], {})

vim.keymap.set("n", "<space>feu<space>", [[:<c-u><c-r>=printf("CtrlSF -S %s %s", expand("<cword>"), expand("%:p"))<CR><CR>]], {silent = true})
vim.keymap.set("x", "<space>feu<space>", [[:<c-u><c-r>=printf("CtrlSF -S %s %s", leaderf#Rg#visual()), expand("%:p")<cr><cr>]], {silent = true})
vim.keymap.set("n", "<space>fei<space>", [[:<c-u><c-r>=printf("CtrlSF -S \"\" %s", expand("%:p"))<cr><c-f>0f"a]], {silent = true})
vim.keymap.set("x", "<space>fei<space>", [[:<c-u><c-r>=printf("CtrlSF -S \"\" %s", leaderf#Rg#visual(), expand("%:p"))<cr><c-f>0f"a]], {silent = true})

vim.keymap.set("n", "<space>feui<space>", [[:CtrlSFOpen<cr>]], {})
vim.keymap.set("n", "<space>feiu<space>", [[:CtrlSFOpen<cr>]], {})

vim.g.ctrlsf_absolute_file_path = 1
vim.g.ctrlsf_backend = "rg"
vim.g.ctrlsf_auto_focus = { at = "start" }
vim.g.ctrlsf_default_view_mode = "normal"
vim.g.ctrlsf_extra_backend_args = {
  rg = [[--glob "!tags" --glob "!tags.*"]]
}
vim.g.ctrlsf_position = "bottom"
vim.g.ctrlsf_preview_position = "inside"
vim.g.ctrlsf_context = "-C 5"
