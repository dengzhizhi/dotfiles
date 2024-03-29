local tc = require('nvim-treeclimber')

-- Highlight groups
-- Change if you don't have Lush installed
-- local color = require("nvim-treeclimber.hi")
-- local bg = color.bg_hsluv("Normal")
-- local fg = color.fg_hsluv("Normal")
-- local dim = bg.mix(fg, 20)
--
-- vim.api.nvim_set_hl(0, "TreeClimberHighlight", { background = dim.hex })
--
-- vim.api.nvim_set_hl(0, "TreeClimberSiblingBoundary", { background = color.terminal_color_5.hex })
--
-- vim.api.nvim_set_hl(0, "TreeClimberSibling", { background = color.terminal_color_5.mix(bg, 40).hex, bold = true })
--
-- vim.api.nvim_set_hl(0, "TreeClimberParent", { background = bg.mix(fg, 2).hex })
--
-- vim.api.nvim_set_hl(0, "TreeClimberParentStart", { background = color.terminal_color_4.mix(bg, 10).hex, bold = true })

-- Keymaps

vim.keymap.set("n", "<leader>k", tc.show_control_flow, keyopts)

vim.keymap.set({ "x", "o" }, "i.", tc.select_current_node, { desc = "select current node" })

vim.keymap.set({ "x", "o" }, "a.", tc.select_expand, { desc = "select parent node" })

vim.keymap.set(
  { "n", "x", "o" },
  "<M-e>",
  tc.select_forward_end,
  { desc = "select and move to the end of the node, or the end of the next node" }
)

vim.keymap.set(
  { "n", "x", "o" },
  "<M-b>",
  tc.select_backward,
  { desc = "select and move to the begining of the node, or the beginning of the next node" }
)

vim.keymap.set({ "n", "x", "o" }, "<A-[>", tc.select_siblings_backward, {})

vim.keymap.set({ "n", "x", "o" }, "<A-]>", tc.select_siblings_forward, {})

vim.keymap.set(
  { "n", "x", "o" },
  "<M-g>",
  tc.select_top_level,
  { desc = "select the top level node from the current position" }
)

vim.keymap.set({ "n", "x", "o" }, "<A-left>", tc.select_backward, { desc = "select previous node" })
vim.keymap.set({ "n", "x", "o" }, "<A-down>", tc.select_shrink, { desc = "select child node" })
vim.keymap.set({ "n", "x", "o" }, "<A-up>", tc.select_expand, { desc = "select parent node" })
vim.keymap.set({ "n", "x", "o" }, "<A-right>", tc.select_forward, { desc = "select the next node" })
vim.keymap.set({ "n", "x", "o" }, "<A-L>", tc.select_grow_forward, { desc = "Add the next node to the selection" })
vim.keymap.set({ "n", "x", "o" }, "<A-H>", tc.select_grow_backward, { desc = "Add the previous node to the selection" })
