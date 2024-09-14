require("bufferline").setup({
  options = {
    -- numbers = "buffer_id",
    numbers = function(opts)
      return opts.raise(opts.id)
    end,
    close_command = "bdelete! %d",
    right_mouse_command = nil,
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = '', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    name_formatter = function(buf)  -- buf contains:
      -- Prefix buffer title with status icons for better overview
      local buf_name = buf.name
      if buf.path ~= nil and string.match(buf_name, 'index%.[jt]sx?') ~= nil then
        buf_name = string.match(buf.path, ".*/(.*/[^/]+)$")  -- when the file is index.js, include the parent folder name
      end;
      if vim.b[buf.bufnr].tab_title then
        buf_name = vim.b[buf.bufnr].tab_title
      end
      if buf.bufnr then
        local bt = vim.bo[buf.bufnr].bt
        if bt == 'nofile' or bt == 'nowrite' then
          buf_name =  '🚮' .. buf_name
        end
      end

      if vim.t.bufferline_show_buffers then
        local should_show = vim.t.bufferline_show_buffers[tostring(buf.bufnr)]
        if vim.t.bufferline_tab_filter_enabled then
          if not should_show then
            buf_name = '👻' .. buf_name
          end
        else
          if should_show then
            buf_name = '👀' .. buf_name
          end
        end
      end

      if not vim.bo[buf.bufnr].modifiable then
        buf_name = '🔒' .. buf_name
      end

      return buf_name
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Files",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    },
    custom_filter = function(bufnr)
      -- if the result is false, this buffer will be shown, otherwise, this
      -- buffer will be hidden.

      -- filter out filetypes you don't want to see
      local exclude_ft = { "qf", "fugitive", "git", "dirvish" }
      local cur_ft = vim.bo[bufnr].filetype
      local should_show = not vim.tbl_contains(exclude_ft, cur_ft)

      if vim.t.bufferline_tab_filter_enabled and not vim.tbl_contains(vim.fn.tabpagebuflist(), bufnr) then
        should_show = should_show
          and vim.t.bufferline_show_buffers
          and vim.t.bufferline_show_buffers[tostring(bufnr)]
      end

      return should_show
    end,

    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 20,
    max_prefix_length = 10,
    tab_size = 10,
    diagnostics = false,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "bar",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "id",
  },
})

vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/bufferline_keymaps.vim')


vim.keymap.set('n', ';wf', function()
  vim.t.bufferline_tab_filter_enabled = not vim.t.bufferline_tab_filter_enabled
  vim.cmd [[redraw!]]
end, {silent=true, desc='Enable manual tab buffer filtering'})

vim.keymap.set('n', ';wa', function()
  if vim.t.bufferline_show_buffers == nil then
    vim.t.bufferline_show_buffers = {}
  end
  local new_value = vim.t.bufferline_show_buffers
  new_value[tostring(vim.fn.bufnr())] = true
  vim.t.bufferline_show_buffers = new_value
  vim.cmd [[redraw!]]
end, {silent=true, desc='Show current buffer in current tab when manual buffer filtering is ON'})

vim.keymap.set('n', ';wd', function()
  if vim.t.bufferline_show_buffers ~= nil then
    local new_value = vim.t.bufferline_show_buffers
    new_value[tostring(vim.fn.bufnr())] = nil
    if next(new_value) == nil then
      vim.t.bufferline_show_buffers = nil
    else
      vim.t.bufferline_show_buffers = new_value
    end
    vim.cmd [[redraw!]]
  end
end, {silent=true, desc='Hide current buffer in current tab when manual buffer filtering is ON'})

