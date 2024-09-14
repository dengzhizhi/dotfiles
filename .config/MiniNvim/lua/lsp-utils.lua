local diagnostics_enabled = true

local toggle_diagnostics = function()
    local null_ls = require('null-ls')
    if diagnostics_enabled then
        null_ls.disable('eslint')
        null_ls.disable('pylint')
        null_ls.disable('tsc')
        diagnostics_enabled = false
        print "Disabled null_ls diagnostics"
    else
        null_ls.enable('eslint')
        null_ls.enable('pylint')
        null_ls.enable('tsc')
        diagnostics_enabled = true
        print "Enabled null_ls diagnostics"
    end
end
vim.keymap.set("n", "<leader>dd", toggle_diagnostics, { desc = 'Toggle null-ls managed diagnostics' })
