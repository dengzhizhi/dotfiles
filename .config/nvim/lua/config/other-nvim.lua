require("other-nvim").setup({
    mappings = {
        -- builtin mappings
        "livewire",
        -- custom mapping
        {
            pattern = [[(.*)%.[jt]sx$]],
            target = [[%1.module.css]],
            context = [[css]],
        },
        {
            pattern = [[(.*)%.([jt]sx)$]],
            target = [[%1_tests.%2]],
            context = [[test]],
        },
        {
            pattern = [[(.*)_tests%.([jt]sx)$]],
            target = [[%1.%2]],
            context = [[SUT]],
        },
        {
            pattern = [[(.*/javascripts)/(.*)%.([jt]sx)$]],
            target = [[%1/tests/%2_tests.%3]],
            context = [[test]],
        },
        {
            pattern = [[(.*/javascripts)/tests/(.*)_tests%.([jt]sx)$]],
            target = [[%1/%2.%3]],
            context = [[SUT]],
        },
        {
            pattern = [[(.*)%.module.css$]],
            target = [[%1.jsx]],
            context = [[jsx]],
        },
        {
            pattern = [[(.*)/interview_notes.md$]],
            target = [[%1/notes.md]],
            context = [[notes]],
        },
    },
    hooks = {
        filePickerBeforeShow = function(files)
            return files
        end,
    },
    style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = "rounded",

        -- Column seperator for the window
        seperator = "|",

	-- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
	width = 0.7,

	-- min height in rows.
	-- when more columns are needed this value is extended automatically
	minHeight = 5
    },
})


vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";df", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";dc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

-- Context specific bindings
vim.api.nvim_set_keymap("n", "<leader>lt", "<cmd>:Other test<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>:Other scss<CR>", { noremap = true, silent = true })
