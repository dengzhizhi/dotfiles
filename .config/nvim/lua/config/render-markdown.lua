require('render-markdown').setup({
    heading = {
        -- Turn on / off any sign column related rendering
        sign = false,

        icons = {
            '§ ',
            '󰨑 ',
            ' ',
            ' ',
            '󰡖 ',
            '󰝣 ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- '󰜌 ',
            -- '󰌕 ',
            -- '󰣡 ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- '󰝥 ',
            -- '󰝦 ',
            -- '󰝤 ',
            -- '󰠖 ',
            -- ' ',
            -- ' ',
            -- '󰫊 ',
            -- '󰜗 ',
            -- '󰳭 ',
            -- '󰫈 ',
            -- '󰜀 ',
            -- '󰜁 ',
            -- '󰪥 ',
            -- '󰛸 ',
            -- '󰃠 ',
            -- '󰛹 ',
            -- '󰛓 ',
            -- '󰗼 ',
            -- '󰖙 ',
            -- '󰌖 ',
            -- '󰉊 ',
            -- '󰃞 ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- ' ',
            -- '󰸶 ',
        },
        signs = { '󰉫', '󰉬', '󰉭', '󰉮', '󰉯', '󰉰' },
    },

    link = {
        custom = {
            web = { pattern = '🫥🫥🫥🫥', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
        },
    },

    callout = {
        note = { raw = '[!NOTE]', rendered = '󰙎 Note:', highlight = 'RenderMarkdownInfo' },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip:', highlight = 'RenderMarkdownSuccess' },
        important = { raw = '[!IMPORTANT]', rendered = '󰳧 Important:', highlight = 'RenderMarkdownHint' },
        warning = { raw = '[!WARNING]', rendered = '⚠️  Warning', highlight = 'RenderMarkdownWarn' },
        caution = { raw = '[!CAUTION]', rendered = '󰙌 Caution:', highlight = 'RenderMarkdownError' },
        -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
        abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract:', highlight = 'RenderMarkdownInfo' },
        todo = { raw = '[!TODO]', rendered = ' Todo:', highlight = 'RenderMarkdownInfo' },
        success = { raw = '[!SUCCESS]', rendered = '󰄬 Success:', highlight = 'RenderMarkdownSuccess' },
        question = { raw = '[!QUESTION]', rendered = ' Question:', highlight = 'RenderMarkdownQuestion' },
        failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure:', highlight = 'RenderMarkdownError' },
        danger = { raw = '[!DANGER]', rendered = '󱐌 Danger:', highlight = 'RenderMarkdownError' },
        bug = { raw = '[!BUG]', rendered = '󰨰 Bug:', highlight = 'RenderMarkdownError' },
        example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example:', highlight = 'RenderMarkdownHint' },
        quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote:', highlight = 'RenderMarkdownQuote' },
        hate = { raw = '[!HATE]', rendered = '🤮 Hate', highlight = 'RenderMarkdownHate' },
        wip = { raw = '[!WIP]', rendered = '🚧 WIP', highlight = 'RenderMarkdownWIP' },
        research = { raw = '[!Research]', rendered = '🔬 Research', highlight = 'RenderMarkdownResearch' },
    },
    indent = {
        -- Turn on / off org-indent-mode
        enabled = true,
        -- Amount of additional padding added for each heading level
        per_level = 2,
    },
    sign = {
        enabled = false,
    },
})

-- vim.api.nvim_set_hl(0, 'RenderMarkdownQuestion', { default = true, fg='#ECBE7B' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownHate', { default = true, fg='#FF6C6B' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownWIP', { default = true, fg='#98BE65' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownResearch', { default = true, fg='#98BE65' })

vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = "#A0FFFF" })
vim.api.nvim_set_hl(0, "RenderMarkdownSuccess", { fg = "#50FA7B" })
vim.api.nvim_set_hl(0, "RenderMarkdownHint", { fg = "#6DDBEF" })
vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = "#F99157" })
vim.api.nvim_set_hl(0, "RenderMarkdownError", { fg = "#FF6347" })
vim.api.nvim_set_hl(0, "RenderMarkdownQuestion", { fg = "#FFDDFF" })
vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = "#C0C0C0" })
vim.api.nvim_set_hl(0, "RenderMarkdownHate", { fg = "#FFBBEE" })
vim.api.nvim_set_hl(0, "RenderMarkdownWIP", { fg = "#8E67FF" })
vim.api.nvim_set_hl(0, "RenderMarkdownResearch", { fg = "#FFF569" })

-- vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#2F4F4F", bg = "#E0FFFF", italic = true })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#483D8B", bg = "#E6E6FA", italic = true, bold = true })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#191970", bg = "#FFFFE0" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#000000", bg = "#F0FFF0" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#3A4F60", bg = "#FFE5C0" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#2E3D58", bg = "#B0B0C0" })


vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#8BE9FD", bg = "#505050", italic = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#50FA7B", bg = "#505050", italic = true, bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#F1FA8C", bg = "#505050", bold = true})
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#FF79C6", bg = "#505050", bold = true})
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#BD93F9", bg = "#505050", bold = true})
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#FFB86C", bg = "#505050", bold = true})
