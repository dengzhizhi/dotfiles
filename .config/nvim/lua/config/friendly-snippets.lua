local ls = require "luasnip"
require("luasnip/loaders/from_vscode").lazy_load()
ls.filetype_extend("javascript", {"javascript", "react"})
ls.filetype_extend("typescript", {"typescript", "react-ts"})
ls.filetype_extend("css", {"css"})
ls.filetype_extend("gitcommit", {"gitcommit"})
ls.filetype_extend("latex", {"latex"})
ls.filetype_extend("lua", {"lua"})
ls.filetype_extend("markdown", {"markdown"})
ls.filetype_extend("org", {"org"})

