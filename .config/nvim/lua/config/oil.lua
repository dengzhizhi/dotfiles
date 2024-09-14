require("oil").setup({
    keymaps = {
	["yy"] = "actions.copy_entry_path",
    },
})

vim.keymap.set("n", ",ls", require("oil").open_float, { desc = "Open pwd directory" })

