local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    question = { pattern = '%f[%w]()QUESTION()%f[%W]', group = 'MiniHipatternsQuestion' },
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Header highlighting covered by renderMarkdown plugin
    -- mdhead1 = {
    --   pattern = function(buf_id)
    --     if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
    --     return '^()%#%s+[%w<].*()'
    --   end,
    --   group = 'MarkdownHead1',
    -- },
    -- mdhead2 = {
    --   pattern = function(buf_id)
    --     if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
    --     return '^()%##%s+[%w<].*()'
    --   end,
    --   group = 'MarkdownHead2',
    -- },
    -- mdhead3 = {
    --   pattern = function(buf_id)
    --     if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
    --     return '^()%###%s+[%w<].*()'
    --   end,
    --   group = 'MarkdownHead3',
    -- },
    -- mdhead4 = {
    --   pattern = function(buf_id)
    --     if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
    --     return '^()%####+%s+[%w<].*()'
    --   end,
    --   group = 'MarkdownHead4',
    -- },

    mdmemo = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '📝%s*()[%w:~./_-]+()'
      end,
      group = 'MarkdownMemoWord',
    },

    mdwarning = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '^[%s%-]*⚠️%s*().+()'
      end,
      group = 'MarkdownWarningParagraph',
    },

    mdquestion = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '^[%s%-]*❓%s*().+()'
      end,
      group = 'MarkdownQuestionParagraph',
    },

    mdquestion2 = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '^[%s%-]*()[?]%s*.+()'
      end,
      group = 'MiniHipatternsQuestion',
    },

    mdinfo = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '^[%s%-]*ℹ️%s*().+()'
      end,
      group = 'MarkdownInfoParagraph',
    },

    mdhighlight1 = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'markdown' then return nil end
        return '%^%^()[%w].%{-%}[^%s]()%^%^'
      end,
      group = 'MarkdownHighLight1',
    },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})


vim.defer_fn(function()
  -- vim.api.nvim_set_hl(0, 'MarkdownHead1', { default = true, fg='#2F4F4F', bg='#E0FFFF', italic=true })
  -- vim.api.nvim_set_hl(0, 'MarkdownHead2', { default = true, fg='#483D8B', bg='#E6E6FA', italic=true, bold=true })
  -- vim.api.nvim_set_hl(0, 'MarkdownHead3', { default = true, fg='#191970', bg='#FFFFE0' })
  -- vim.api.nvim_set_hl(0, 'MarkdownHead4', { default = true, fg='#000000', bg='#F0FFF0' })
  vim.api.nvim_set_hl(0, 'MarkdownMemoWord', { default = true, fg='#FFFFD0', underline=true })
  vim.api.nvim_set_hl(0, 'MarkdownWarningParagraph', { default = true, fg='#2F4F4F', bg='#FFFFA0' })
  vim.api.nvim_set_hl(0, 'MarkdownQuestionParagraph', { default = true, fg='#2F4F4F', bg='#FFDDFF' })
  vim.api.nvim_set_hl(0, 'MarkdownInfoParagraph', { default = true, fg='#2F4F4F', bg='#A0FFFF' })
  vim.api.nvim_set_hl(0, 'MiniHipatternsQuestion', { default = true, fg='#FFDDFF', italic=true })

  vim.api.nvim_set_hl(0, 'htmlBold', { default = true, fg='#FFFFFF', bg='#575c00', italic=true, bold=true })
  vim.api.nvim_set_hl(0, 'mkdCode', { default = true, fg='#FF7F50' })
end, 3500)

