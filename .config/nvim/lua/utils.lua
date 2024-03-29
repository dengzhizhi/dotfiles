local uv = vim.loop
local api = vim.api

_G.inspect = function(...)
  print(vim.inspect(...))
end

-- Default keymap option
local get_map_options = function(custom_options)
    local options = { noremap = true, silent = true }
    if custom_options then
        options = vim.tbl_extend('force', options, custom_options)
    end
    return options
end

local M = {}

function M.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end

M.map = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({ 'n', 'o', 'i', 'x', 't' }) do
    M[mode .. 'map'] = function(...)
        M.map(mode, ...)
    end
end

M.buf_map = function(bufnr, mode, target, source, opts)
    opts = opts or {}
    opts.buffer = bufnr

    M.map(mode, target, source, get_map_options(opts))
end

M.for_each = function(tbl, cb)
    for _, v in ipairs(tbl) do
        cb(v)
    end
end

M.buf_command = function(bufnr, name, fn, opts)
    api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.command = function(name, fn, opts)
    api.nvim_create_user_command(name, fn, opts or {})
end

M.input = function(keys, mode)
    vim.api.nvim_feedkeys(M.t(keys), mode or 'i', true)
end

M.warn = function(msg)
    api.nvim_echo({ { msg, 'WarningMsg' } }, true, {})
end

M.is_file = function(path)
    if path == '' then
        return false
    end

    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == 'file'
end

M.make_floating_window = function(custom_window_config, height_ratio, width_ratio)
    height_ratio = height_ratio or 0.8
    width_ratio = width_ratio or 0.8

    local height = math.ceil(vim.opt.lines:get() * height_ratio)
    local width = math.ceil(vim.opt.columns:get() * width_ratio)
    local window_config = {
        relative = 'editor',
        style = 'minimal',
        border = 'rounded',
        width = width,
        height = height,
        row = width / 2,
        col = height / 2,
    }
    window_config = vim.tbl_extend('force', window_config, custom_window_config or {})

    local bufnr = api.nvim_create_buf(false, true)
    local winnr = api.nvim_open_win(bufnr, true, window_config)
    return winnr, bufnr
end

M.get_system_output = function(cmd)
    return vim.split(vim.fn.system(cmd), '\n')
end

M.get_cwd = function()
    return uv.cwd
end

---@param level number|nil
---@param msg string
---@param title string
M.notif = function(title, msg, level)
    vim.notify(msg, level, { title = title })
end

return M
