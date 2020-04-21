require'azy'.setup {
  preview = false, -- Whether to preview selected items on the fly (this is an unstable feature, feedback appreciated)
  debug = false, -- Enable debug output and timings in the UI
  mappings = { -- Configure the mappings
    ["<C-k>"] = "prev", -- Select the previous item
    ["<C-j>"] = "next", -- Select the next item
    ["<CR>"] = "confirm", -- Confirm the selection, open the selected item
    ["<C-V>"] = "confirm_vsplit", -- Same as confirm but in a vertical split
    ["<C-H>"] = "confirm_split", -- Same as confirm but in a horizontal split

    -- Normal mode mapping are not configurable:
    -- <ESC>: exits without confirm
  },
}

-- Somehow native vim keymap with `lua` prefix doesn't work
local opts = { silent=true }
vim.keymap.set("n", "<space>ff<space>", require'azy.builtins'.files(), opts)
vim.keymap.set("n", "<space>fc<space>", require'azy.builtins'.quickfix(), opts)
vim.keymap.set("n", "<space>fh<space>", require'azy.builtins'.help(), opts)
vim.keymap.set("n", "<space>fb<space>", require'azy.builtins'.buffers(), opts)
vim.keymap.set("n", "<space>fre<space>", require'azy.builtins'.lsp.references(), opts)
vim.keymap.set("n", "<space>fd<space>", require'azy.builtins'.lsp.document_symbol(), opts)
vim.keymap.set("n", "<space>fdd<space>", require'azy.builtins'.lsp.workspace_symbols(), opts)

