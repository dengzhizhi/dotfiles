function setqflist_current_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)
  local items = {}
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':t')

  for _, diagnostic in ipairs(diagnostics) do
    local item = {
      bufnr = bufnr,
      lnum = diagnostic.lnum + 1,
      col = diagnostic.col + 1,
      text = diagnostic.message,
    }
    table.insert(items, item)
  end

  vim.fn.setqflist({}, ' ', {title = 'Diagnostics [' .. filename .. ']', items = items})
end
