require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
}
vim.api.nvim_create_autocmd(
  { "BufEnter" },
  {
    callback = function()
      vim.cmd([[hi MatchParen cterm=bold,underline gui=bold,underline ctermbg=none guibg=none]])
    end
  }
)

-- vim.cmd([[NoMatchParen]])
