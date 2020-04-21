vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

require('hop').setup({
  case_insensitive = true,
  char2_fallback_key = '<CR>',
})

_G.ChineseBuffer = function()
  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('', 'f', function()
    hop.hint_patterns({ direction = directions.AFTER_CURSOR }, '...')
  end, {remap=true, buffer = true})
  vim.keymap.set('', 'F', function()
    hop.hint_patterns({ direction = directions.BEFORE_CURSOR }, '...')
  end, {remap=true, buffer = true})
  vim.keymap.set('', 't', function()
    hop.hint_patterns({ direction = directions.AFTER_CURSOR, hint_offset = -1 }, '...')
  end, {remap=true, buffer = true})
  vim.keymap.set('', 'T', function()
    hop.hint_patterns({ direction = directions.BEFORE_CURSOR, hint_offset = 1 }, '...')
  end, {remap=true, buffer = true})
  vim.keymap.set({'n', 'x', 'o'}, ';j', function()
    hop.hint_patterns({ hint_offset = 1 }, '...')
  end, {remap=true, buffer = true})
end

vim.cmd [[command! ChineseBuffer lua ChineseBuffer()]]

-- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char2()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap('n', '<space>fj<space>', "<cmd>lua require'hop'.hint_lines()<cr>", {});
-- vim.api.nvim_set_keymap('o', '<space>fj<space>', "<cmd>lua require'hop'.hint_lines()<cr>", {});
-- Mapper.map('',  'gsj',              "<cmd>lua require'hop'.hint_lines()<cr>", {noremap = true}, "EasyMotion", "easy_motion_hint_lines_alt",         "Easy motion to line")
-- Mapper.map('o', 'gsj',              "<cmd>lua require'hop'.hint_lines()<cr>", {noremap = true}, "EasyMotion", "easy_motion_hint_lines_virtual_alt", "Easy motion to line")

-- vim.api.nvim_set_keymap('n', '<space>fl<space>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true })<cr>", {});
-- vim.api.nvim_set_keymap('o', '<space>fl<space>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  current_line_only = true })<cr>", {});
-- vim.api.nvim_set_keymap('n', '<space>fh<space>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {});
-- vim.api.nvim_set_keymap('o', '<space>fh<space>', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {});
-- vim.api.nvim_set_keymap('n', '<space>fk<space>', "<cmd>lua require'hop'.hint_char1()<cr>", {});
-- vim.api.nvim_set_keymap('o', '<space>fk<space>', "<cmd>lua require'hop'.hint_char1()<cr>", {});
-- vim.api.nvim_set_keymap('n', '<space>fi<space>', "<cmd>lua require'hop'.hint_char2()<cr>", {});
-- vim.api.nvim_set_keymap('o', '<space>fi<space>', "<cmd>lua require'hop'.hint_char2()<cr>", {});
-- vim.api.nvim_set_keymap('n', 'gs', "<cmd>HopWord<cr>", {});
-- vim.api.nvim_set_keymap('n', '<c-space><c-j>', "<cmd>HopWord<cr>", {});
-- vim.api.nvim_set_keymap('o', 'gs', "<cmd>HopWord<cr>", {});
-- vim.api.nvim_set_keymap('o', '<c-space><c-j>', "<cmd>HopWord<cr>", {});
