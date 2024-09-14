local null_ls = require("null-ls")

null_ls.setup({
    cmd = {"/Users/zdeng/bin/nvim/0.10.0/bin/nvim"},
    debounce = 60000,
    default_timeout = 5000,
    sources = {
        -- null_ls.builtins.code_actions.xo,
        -- null_ls.builtins.code_actions.eslint_d,
        -- null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.tsc.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.cljstyle,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.fixjson,
    },
})
