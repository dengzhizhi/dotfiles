local MiniMap = require('mini.map')
if vim.g.goneovim == nil then
  MiniMap.setup({
    integrations = {
      MiniMap.gen_integration.builtin_search(),
      MiniMap.gen_integration.gitsigns(),
      MiniMap.gen_integration.diagnostic(),
    }
  })

  vim.keymap.set('n', '<Leader>mc', MiniMap.close)
  vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus)
  vim.keymap.set('n', '<Leader>mo', MiniMap.open)
  vim.keymap.set('n', '<Leader>mr', MiniMap.refresh)
  vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side)
  vim.keymap.set('n', '<Leader>mt', MiniMap.toggle)
else
  -- Use goneovim's native minimap
  vim.keymap.set('n', '<Leader>mt', '<CMD>GonvimMiniMap<CR>')
end
