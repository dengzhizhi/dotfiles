local luatab = require('luatab')
local helpers = luatab.helpers
local winCountIcon = {
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
}


local function windowCount(index)
    local nwins = 0
    local success, wins = pcall(vim.api.nvim_tabpage_list_wins, index)
    if success then
        for _ in pairs(wins) do nwins = nwins + 1 end
    end
    return nwins > 1 and winCountIcon[math.min(nwins, 10)] or ''
end

local function safeTabVar(tabnr, varName)
  local s, v = pcall(function()
    return vim.api.nvim_tabpage_get_var(tabnr, varName)
  end)
  if s then return v else return nil end
end

local function title(tabnr, bufnr)
    local customTitle = safeTabVar(tabnr, "luatab_custom_title")
    if customTitle ~= nil and customTitle ~= '' and customTitle ~= "-" then
      return tostring(tabnr) .. ' ' .. customTitle
    end
    local file = vim.fn.bufname(bufnr)
    local buftype = vim.fn.getbufvar(bufnr, '&buftype')
    local filetype = vim.fn.getbufvar(bufnr, '&filetype')

    if buftype == 'help' then
        return tostring(tabnr) .. ' help:' .. vim.fn.fnamemodify(file, ':t:r')
    elseif buftype == 'quickfix' then
        return 'quickfix'
    elseif filetype == 'TelescopePrompt' then
        return tostring(tabnr) .. ' Telescope'
    elseif filetype == 'git' then
        return tostring(tabnr) .. ' Git'
    elseif filetype == 'fugitive' then
        return tostring(tabnr) .. ' Fugitive'
    elseif filetype == 'dirvish' then
        return tostring(tabnr) .. ' Dirvish'
    elseif file:sub(file:len()-2, file:len()) == 'FZF' then
        return tostring(tabnr) .. ' FZF'
    elseif filetype == 'toggleterm' then
        return tostring(tabnr) .. ' Terminal'
    elseif buftype == 'terminal' then
        local _, mtch = string.match(file, "term:(.*):(%a+)")
        return tostring(tabnr) .. ' ' .. mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ':t')
    elseif file == '' then
        return tostring(tabnr) .. ' [No Name]'
    else
        return tostring(tabnr) .. ' ' .. vim.fn.pathshorten(vim.fn.fnamemodify(file, ':p:~:t'))
    end
end

local function cell(index)
    local isSelected = vim.fn.tabpagenr() == index
    local buflist = vim.fn.tabpagebuflist(index)
    local winnr = vim.fn.tabpagewinnr(index)
    local bufnr = buflist[winnr]
    local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

    return hl .. '%' .. index .. 'T' .. ' ' ..
        helpers.devicon(bufnr, isSelected) .. '%T' ..
        title(index, bufnr) ..
        helpers.modified(bufnr) ..
        windowCount(index) ..
        helpers.separator(index)
end

luatab.setup {
  cell = cell
}

vim.cmd([[command! -nargs=* RenameTab let t:luatab_custom_title=<f-args>|norm <c-l>]])

