local set_buf_keymap = function()
  local opt = { silent = true, noremap = true, nowait = true, buffer = 0}
  vim.keymap.set('n', '<space>cpf<space>',
    function()
      vim.fn.setreg('*', require('dirbuf').get_cursor_path())
    end,
    opt)
  vim.keymap.set('n', '<space>cp<space>',
    function()
      vim.fn.setreg('*', require('dirbuf').get_cursor_path())
    end,
    opt)
  vim.keymap.set('n', ';q', '<CMD>bd<CR>', opt)
  vim.keymap.set('n', '[', '<Plug>(dirbuf_up)', opt)
  vim.keymap.set('n', ']', '<Plug>(dirbuf_enter)', opt)
  vim.keymap.set('n', '>', '<Plug>(dirbuf_history_forward)', opt)
  vim.keymap.set('n', '<', '<Plug>(dirbuf_history_backward)', opt)
end

vim.api.nvim_create_autocmd( 'FileType', {
    pattern = 'dirbuf',
    callback = set_buf_keymap,
  }
)
