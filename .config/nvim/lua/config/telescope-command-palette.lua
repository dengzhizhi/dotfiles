local telescope = require('telescope')

telescope.setup({
  extensions = {
    command_palette = {
      {"Vim Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()" },
        { "My plugin shortcut", ":e ~/.config/nvim/fonts.vim", 0 },
      },
      {"Telescope",
        { "jumps", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()" },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history", ":lua require('telescope.builtin').search_history()" },
        { "Smart open file", ":Telescope smart_open" },
      },
      {"LSP",
        { "Stop python conjure", ":ConjurePythonStop" },
        { "Disable nullls typescript", ":lua require('null-ls').disable('tsc')" },
        { "Disable nullls eslint", ":lua require('null-ls').disable('eslint')" },
        { "Disable nullls pylint", ":lua require('null-ls').disable('pylint')" },
      },
      {"External Filter",
        { "Add line number with nl", ":'<,'>!nl -ba -s '. ' -w 3" },
      },
    }
  }
})

telescope.load_extension('command_palette')

vim.keymap.set('n', "<space>p<space>", '<CMD>Telescope command_palette<CR>', {silent = true})
