
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = {
    '~/dev/zhizhi/workjournal/org',
    "~/dev/zhizhi/workjournal/org/notes.org",
    "~/dev/zhizhi/workjournal/org/journal.org",
    "~/dev/zhizhi/workjournal/notes/habit.org",
    "~/dev/zhizhi/workjournal/notes/retro.org",
    "~/dev/zhizhi/workjournal/notes/working_note.org",
    "~/dev/zhizhi/workjournal/notes/archived_note.org",
    "~/dev/zhizhi/workjournal/notes/slack_record/slack_record.org",
  },
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

